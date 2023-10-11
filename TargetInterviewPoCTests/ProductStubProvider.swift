//
//  ProductStubProvider.swift
//  TargetInterviewPoCTests
//
//  Created by Amin Siddiqui on 11/10/23.
//

import Foundation
@testable import TargetInterviewPoC

final class ProductStubProvider: ProductProvider {
    var products: [Product]
    
    init(products: [Product]) {
        self.products = products
    }
    
    func update(products: [Product]) {
        self.products = products
    }
    
    func getProducts() async throws -> [Product] {
        return products
    }
}
