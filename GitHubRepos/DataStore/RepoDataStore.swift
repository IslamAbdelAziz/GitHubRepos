//
//  RepoDataStore.swift
//  GitHubRepos
//
//  Created by iSlam AbdelAziz on 27/07/2025.
//

import Foundation
import Observation

@Observable
class RepoDataStore {
    
    let httpClient: HTTPClient
    
    var reposList: [ModelRepo] = []
    
    // DI
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func loadRepos() async throws {
        let resource = GenericResource(url: API.repoList.path, method: API.repoList.method, modelType: [ModelRepo].self)
        do {
            reposList = try await httpClient.load(resource) ?? []
        } catch {
            throw error
        }
    }
    
}
