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
    init(id: Int? = nil, name: String? = nil, fullName: String? = nil, description: String? = nil, owner: ModelOwner? = nil) {
        self.id = id
        self.name = name
        self.fullName = fullName
        self.description = description
        self.owner = owner
    }
    
    static
    func createSample() -> ModelRepo {
        ModelRepo(id: 121, name: "Sample Repo", fullName: "Sample Repo", description: "This is a sampleis a sampleis a sampleis a sampleis a sampleis a sampleis a sampleis a sampleis a sampleis a sampleis a sampleis a sampleis a sampleis a sampleis a sampleis a sampleis a sampleis a sampleis a sampleis a sample repo", owner: .init(id: 1221, login: "sampleUser", avatarUrl: "https://example.com/avatar.png"))
    }
}

struct ModelOwner: Codable {
    let id: Int?
    let login: String?
    let avatarUrl: String?

}
