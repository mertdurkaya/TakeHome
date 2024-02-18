//
//  UserDetailResponse.swift
//  TakeHome
//
//  Created by Mert Durkaya on 17/02/2024.
//

import Foundation

// MARK: - UserDetailResponse
struct UserDetailResponse: Codable {
    let data: User
    let support: Support
}
