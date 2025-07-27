//
//  ModelRepo.swift
//  GitHubRepos
//
//  Created by iSlam AbdelAziz on 27/07/2025.
//

import Foundation

struct ModelRepo: Codable, Identifiable {
    let id: Int?
    let name: String?
    let fullName: String?
    let description: String?
    let owner: ModelOwner?

}

struct ModelOwner: Codable {
    let id: Int?
    let login: String?
    let avatarUrl: String?

}
