//
//  ProductProvider.swift
//  TargetInterviewPoC
//
//  Created by Amin Siddiqui on 11/10/23.
//

import Foundation

protocol ProductProvider {
    func getProducts() async throws -> [Product]
}
