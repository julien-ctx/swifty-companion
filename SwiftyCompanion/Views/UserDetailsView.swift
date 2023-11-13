//
//  UserDetailsView.swift
//  SwiftyCompanion
//
//  Created by Julien Caucheteux on 10/11/2023.
//

import Foundation
import SwiftUI

struct UserDetailsView: View {
    @State var isLoading: Bool = true
    let login: String
    
    func getApiUrl() {
        if let apiUrl = NetworkContext.shared.apiUrl {
            print("Yes")
        }
    }
    
    var body: some View {
        Group {
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2)
            } else {
                Text(login)
            }
        }
        .onAppear(perform: getApiUrl)
    }
}
