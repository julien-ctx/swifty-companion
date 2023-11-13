//
//  Token.swift
//  SwiftyCompanion
//
//  Created by Julien Caucheteux on 13/11/2023.
//

import Foundation

// MARK: - Token
struct Token: Codable {
    let accessToken, tokenType: String
    let expiresIn: Int
    let scope: String
    let createdAt, secretValidUntil: Int
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case scope
        case createdAt = "created_at"
        case secretValidUntil = "secret_valid_until"
    }
}
