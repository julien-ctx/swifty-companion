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
    
    private init() {
        getEnvironmentVariables()
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
    
    private func checkAccessTokenValidity() async {
        if self.accessToken == nil || (self.expirationTime ?? 0) < Int(Date().timeIntervalSince1970) {
            await getAccessToken()
        }
    }
    
    private func getAccessToken() async {
        guard let apiUrl = self.apiUrl, let clientId = self.clientId, let clientSecret = self.clientSecret else {
            print("Error: API URL, Client ID, or Client Secret is missing")
            return
        }
        
        guard let url = URL(string: "\(apiUrl)oauth/token") else {
            print("Error while creating the URL to get the access token")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let bodyParameters = "grant_type=client_credentials&client_id=\(clientId)&client_secret=\(clientSecret)"
        request.httpBody = bodyParameters.data(using: .utf8)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Invalid response from server when getting access token")
                return
            }
            
            guard let decodedResponse = try? JSONDecoder().decode(Token.self, from: data) else {
                print("Error while decoding")
                return
            }
            self.accessToken = decodedResponse.accessToken
            self.expirationTime = Int(decodedResponse.expiresIn) + Int(decodedResponse.createdAt)
        } catch {
            print("Error making request to get access token: \(error)")
        }
    }
    
    func getUserInformation(login: String) async throws -> User? {
        await checkAccessTokenValidity()
        
        guard let apiUrl = self.apiUrl, let accessToken = self.accessToken,
              let url = URL(string: "\(apiUrl)users/\(login)") else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.noData
        }
        var decodedResponse: User?
        do {
            decodedResponse = try JSONDecoder().decode(User.self, from: data)
        } catch {
            print("Error decoding JSON: \(error)")
        }
        return decodedResponse
    }
    
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingFailed
}
