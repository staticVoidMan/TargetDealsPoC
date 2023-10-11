//
//  ProductListRequest.swift
//  TargetInterviewPoC
//
//  Created by Amin Siddiqui on 11/10/23.
//

import Foundation

struct ProductListRequest: Requestable {
    
    var route: RequestPath { APIEndpoints.deals }
    var method: HTTPMethod { .get }
}
