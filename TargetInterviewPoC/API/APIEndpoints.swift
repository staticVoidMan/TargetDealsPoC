//
//  APIEndpoints.swift
//  TargetInterviewPoC
//
//  Created by Amin Siddiqui on 11/10/23.
//

import Foundation

enum APIEndpoints {
    case base
    case deals
}

extension APIEndpoints: RequestPath {
    
    var path: String {
        switch self {
        case .base:
            return "https://api.target.com/mobile_case_study_deals/v1/"
        case .deals:
            return "deals"
        }
    }
}

extension Requestable {
    var base: RequestPath {
        APIEndpoints.base
    }
}
