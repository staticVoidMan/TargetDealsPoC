//
//  NetworkManager.swift
//  TargetInterviewPoC
//
//  Created by Amin Siddiqui on 11/10/23.
//

import Foundation

/*
 NOTE: Scalable structure but implementing bare minimum for the current interview test requirement.
 */

enum NetworkError: Error {
    case invaldURL(string: String)
}

enum HTTPMethod {
    case get
    case post
}

extension HTTPMethod {
    var stringValue: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        }
    }
}

final class NetworkManager {
    
    var jsonDecoder: JSONDecoder = JSONDecoder()
    
    func send<T: Decodable>(_ requestable: Requestable) async throws -> T {
        let request = try requestable.buildRequest()
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = requestable.decoder ?? jsonDecoder
        let result = try decoder.decode(T.self, from: data)
        return result
    }
}
