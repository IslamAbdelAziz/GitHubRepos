//
//  RepoDataStoreTest.swift
//  GitHubReposTests
//
//  Created by iSlam AbdelAziz on 28/07/2025.
//

import Testing
import Foundation

@testable import GitHubRepos

struct RepoDataStoreTest {
    let client = HTTPClient()
        
    @Test func testInitializeDataStoreWithEmptyReposList() {
        let dataStore = RepoDataStore(httpClient: client)
        #expect(dataStore.reposList.isEmpty)
    }
    
    @Test func testFetchReposeFromDataStore() async throws {
        let dataStore = RepoDataStore(httpClient: client)
        try await dataStore.loadRepos()
        #expect(!dataStore.reposList.isEmpty)
        
    }
}
