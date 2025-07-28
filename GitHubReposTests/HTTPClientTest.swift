//
//  HTTPClientTest.swift
//  GitHubReposTests
//
//  Created by iSlam AbdelAziz on 28/07/2025.
//

import Testing
import Foundation

@testable import GitHubRepos

struct HTTPClientTest {
    let client = HTTPClient()
    
    
    @Test func testBadURL() async throws {
        let wrongURL = URL(string: "https://api.github.com/repositoriessss")!
        let resource = GenericResource(url: wrongURL, method: .get, modelType: [ModelRepo].self)
        
        do {
            let _ = try await client.load(resource)
        } catch {
            print(error)
            #expect(type(of: error)  == type(of: NetworkError.httpError(404)))
        }
    }
    
    @Test func testWrongHTTPMethod() async throws {
        let url = URL(string: "https://api.github.com/repositoriee")!
        let resource = GenericResource(url: url, method: .post(nil), modelType: [ModelRepo].self)
        
        do {
            let _ = try await client.load(resource)
        } catch {
            print(error)
            #expect(type(of: error)  == type(of: NetworkError.httpError(404)))
        }
    }
}
