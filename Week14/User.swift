//
//  User.swift
//  Week14
//
//  Created by Yundong Lee on 2021/12/27.
//

import Foundation

// MARK: - User
struct User: Codable {
    let jwt: String
    let user: UserClass
}

// MARK: - UserClass
struct UserClass: Codable {
    let id: Int
    let username, email: String
}
