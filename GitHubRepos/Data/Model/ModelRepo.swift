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
    var creationDate: Date?

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.fullName = try container.decodeIfPresent(String.self, forKey: .fullName)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.owner = try container.decodeIfPresent(ModelOwner.self, forKey: .owner)
        self.creationDate = randomDate(fromDaysAgo: 5, toYearsAgo: 5)
    }
}

struct ModelOwner: Codable {
    let id: Int?
    let login: String?
    let avatarUrl: String?

}
