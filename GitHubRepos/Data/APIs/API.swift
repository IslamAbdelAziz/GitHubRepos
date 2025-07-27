//
//  API.swift
//  GitHubRepos
//
//  Created by iSlam AbdelAziz on 27/07/2025.
//

import Foundation

enum API {
    case repoList
    
    private
    var baseURL: URL {
        URL(string: "https://api.github.com/")!
    }
    
    var path: URL {
        switch self {
        case .repoList:
            return baseURL.appendingPathComponent("repositories")
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
}
