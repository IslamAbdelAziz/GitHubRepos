//
//  ModelReposTest.swift
//  GitHubReposTests
//
//  Created by iSlam AbdelAziz on 28/07/2025.
//

import Testing
import Foundation

@testable import GitHubRepos

struct ModelReposTest {
    
    @Test func testInitializeRepoModel() {
        let id = 333
        let name = "Repo Name"
        let fullName = "Full Repo Name"
        let description = "Repo Details"
        let owner = ModelOwner(id: 22, login: "Owner", avatarUrl: "imgUrl")
        
        
        let repo = ModelRepo(id: id, name: name, fullName: fullName, description: description, owner: owner)
        #expect(repo.id == id)
        #expect(repo.name == name)
        #expect(repo.fullName == fullName)
        #expect(repo.description == description)
        #expect(repo.owner?.id == owner.id)
        #expect(repo.owner?.login == owner.login)
        #expect(repo.owner?.avatarUrl == owner.avatarUrl)
        #expect(repo.creationDate != nil)
    }
    
    @Test func testCreateSampleRepo() {
        let repo = ModelRepo.createSample()
        #expect(repo.id != nil)
        #expect(repo.name != nil)
        #expect(repo.fullName != nil)
        #expect(repo.description != nil)
        #expect(repo.creationDate != nil)
        #expect(repo.owner != nil)
        #expect(repo.owner?.id != nil)
        #expect(repo.owner?.login != nil)
        #expect(repo.owner?.avatarUrl != nil)
    }
}
