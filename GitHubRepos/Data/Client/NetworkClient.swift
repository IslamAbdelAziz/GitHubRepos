//
//  NetworkClient.swift
//  GitHubRepos
//
//  Created by iSlam AbdelAziz on 27/07/2025.
//

import Foundation

import Foundation

//MARK: Client
enum HTTPMethod {
    case get
    case post(Data?)
    case delete
    
    var name: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .delete:
            return "DELETE"
        }
    }
}

struct HTTPClient {
    private
    let session: URLSession
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = [
            "Content-Type": "application/json"
        ]
        self.session = URLSession(configuration: configuration)
    }
    
    func load<T: Codable>(_ resource: GenericResource<T>) async throws -> T? {
        var request = URLRequest(url: resource.api.path)
        request.httpMethod = resource.api.method.name
        
        switch resource.api.method {
        case .post(let body):
            request.httpBody = body
            
        default:
            break
        }
        let (data, response) = try await session.data(for: request)
        
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200..<300).contains(response.statusCode) else {
            throw NetworkError.httpError(response.statusCode)
        }
        
        do {
            let decode = JSONDecoder()
            decode.keyDecodingStrategy = .convertFromSnakeCase
            return try decode.decode(resource.modelType.self, from: data)
        } catch {
            throw NetworkError.decodingError(error)
        }
    }
    
}
