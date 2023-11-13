//
//  EnvironmentManager.swift
//  SwiftyCompanion
//
//  Created by Julien Caucheteux on 13/11/2023.
//

import Foundation

class NetworkContext {
    static let shared = NetworkContext()
    
    var apiUrl: String?
    var clientId: String?
    var clientSecret: String?
    
    var accessToken: String?
    var expirationTime: Int?
    var buffer: Int = 180
    
    private init() {
        getEnvironmentVariables()
        getAccessToken()
    }
    
    private func getEnvironmentVariables() {
        if let envPath = Bundle.main.path(forResource: ".env", ofType: nil) {
            do {
                let envData = try String(contentsOfFile: envPath, encoding: .utf8)
                let elements = envData.components(separatedBy: .newlines)
                for element in elements {
                    let keyValue = element.components(separatedBy: "=")
                    if keyValue.count == 2 {
                        let key = keyValue[0].trimmingCharacters(in: .newlines)
                        let value = keyValue[1].trimmingCharacters(in: .newlines)
                        switch key {
                        case "API_URL":
                            self.apiUrl = value
                        case "CLIENT_ID":
                            self.clientId = value
                        case "CLIENT_SECRET":
                            self.clientSecret = value
                        default:
                            break
                        }
                    }
                }
            } catch {
                print(error)
            }
        } else {
            print("No .env")
        }
    }
    
    func getAccessToken(){
        if let apiUrl = self.apiUrl, let clientId = self.clientId, let clientSecret = self.clientSecret {
            guard let url = URL(string: "\(apiUrl)/oauth/token") else {
                print("Error while creating the URL to get the access token")
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            let bodyParameters = "grant_type=client_credentials&client_id=\(clientId)&client_secret=\(clientSecret)"
            request.httpBody = bodyParameters.data(using: .utf8)
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let httpError = error {
                    print("Error making request to get access token: \(httpError)")
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    print("Invalid response from server when getting access token")
                    return
                }
                if let responseData = data {
                    guard let decodedResponse = try? JSONDecoder().decode(Token.self, from: responseData) else {
                        print("Error while decoding")
                        return
                    }
                    self.accessToken = decodedResponse.accessToken
                    self.expirationTime = Int(decodedResponse.expiresIn) + Int(Date().timeIntervalSince1970)
                }
            }
            
            task.resume()
        }
    }
}
