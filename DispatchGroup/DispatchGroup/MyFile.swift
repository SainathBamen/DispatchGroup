//
//  MyFile.swift
//  DispatchGroup
//
//  Created by Sainath Bamen on 05/10/23.
//

import UIKit

struct Welcome: Codable {
    let data: DataClass
    let support: Support
}

// MARK: - DataClass
struct DataClass: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

// MARK: - Support
struct Support: Codable {
    let url: String
    let text: String
}

