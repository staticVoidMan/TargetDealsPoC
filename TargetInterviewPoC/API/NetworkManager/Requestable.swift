//
//  Requestable.swift
//  TargetInterviewPoC
//
//  Created by Amin Siddiqui on 11/10/23.
//

import Foundation

/*
 NOTE: Scalable structure but implementing bare minimum for the current interview test requirement.
 Refer usage:
 - APIEndpoints
 - ProductListRequest
 - ProductAPIProvider
 */

protocol RequestPath {
    var path: String { get }
}

protocol Requestable {
    var base: RequestPath { get }
    var route: RequestPath { get }
    var method: HTTPMethod { get }
    var body: Encodable? { get }
    
    var encoder: JSONEncoder? { get }
    var decoder: JSONDecoder? { get }
}

extension Requestable {
    
    var encoder: JSONEncoder? { nil }
    var decoder: JSONDecoder? { nil }
    var body: Encodable? { nil }
    
    func buildRequest() throws -> URLRequest {
        let urlString = base.path + route.path
        guard let url = URL(string: urlString)
        else { throw NetworkError.invaldURL(string: urlString) }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.stringValue
        if let body {
            let encoder = encoder ?? JSONEncoder()
            request.httpBody = try encoder.encode(body)
        }
        
        return request
    }
}
