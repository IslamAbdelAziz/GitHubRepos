//
//  FetchReposTests.swift
//  GitHubReposTests
//
//  Created by iSlam AbdelAziz on 28/07/2025.
//

import Testing
import Foundation

@testable import GitHubRepos

struct FetchReposTests {
    let client = HTTPClient()
    
    @Test func testGetRepos() async throws {
        let resource = GenericResource(url: API.repoList.path, method: API.repoList.method, modelType: [ModelRepo].self)
        let result = try await client.load(resource)
        #expect(result != nil)
        #expect(!result!.isEmpty)
    }
}
