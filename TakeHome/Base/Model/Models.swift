//
//  Models.swift
//  TakeHome
//
//  Created by Mert Durkaya on 17/02/2024.
//

import Foundation

// MARK: - User
struct User: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String
}

// MARK: - Support
struct Support: Codable {
    let url: String
    let text: String
}
