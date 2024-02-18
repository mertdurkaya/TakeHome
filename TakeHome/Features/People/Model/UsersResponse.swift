//
//  UserResponse.swift
//  TakeHome
//
//  Created by Mert Durkaya on 17/02/2024.
//

import Foundation

// MARK: - UsersResponse
struct UsersResponse: Codable {
    let page, perPage, total, totalPages: Int
    let data: [User]
    let support: Support
}
