//
//  User.swift
//  SwiftyCompanion
//
//  Created by Julien Caucheteux on 13/11/2023.
//

import Foundation

struct User: Codable {
    let id: Int
    let email, login, firstName, lastName: String
    let image: APIImage
    let staff: Bool
    let correctionPoints: Int
    let location: String?
    let wallet: Int
    let cursusUsers: [CursusUser]
    let projectsUsers: [ProjectsUser]
    let achievements: [Achievement]
    let campus: [Campus]
    
    enum CodingKeys: String, CodingKey {
        case id, email, login
        case firstName = "first_name"
        case lastName = "last_name"
        case image
        case staff = "staff?"
        case correctionPoints = "correction_point"
        case location, wallet
        case cursusUsers = "cursus_users"
        case projectsUsers = "projects_users"
        case achievements
        case campus
    }
}

// MARK: - Image
struct APIImage: Codable {
    let link: String
    let versions: Versions
    
    struct Versions: Codable {
        let large, medium, small, micro: String
    }
}

// MARK: - CursusUser
struct CursusUser: Codable {
    let level: CGFloat
    let skills: [Skill]

    struct Skill: Codable {
        let id: Int
        let name: String
    }
}

// MARK: - ProjectsUser
struct ProjectsUser: Codable {
    let finalMark: Int?
    let status: String
    let validated: Bool?
    let project: Project
    let cursusIds: [Int]

    enum CodingKeys: String, CodingKey {
        case finalMark = "final_mark"
        case status
        case validated = "validated?"
        case project
        case cursusIds = "cursus_ids"
    }
    
    struct Project: Codable {
        let name: String
    }
}

// MARK: - Achievement
struct Achievement: Codable {
    let name: String
    let image: String
}

// MARK: - Campus
struct Campus: Codable {
    let name: String
}
