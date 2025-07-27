//
//  GenericType.swift
//  GitHubRepos
//
//  Created by iSlam AbdelAziz on 27/07/2025.
//

import Foundation

//MARK: Generic Resource
struct GenericResource<T: Codable> {
    var api: API
    var modelType: T.Type
}

