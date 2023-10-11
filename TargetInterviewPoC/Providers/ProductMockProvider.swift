//
//  ProductMockProvider.swift
//  TargetInterviewPoC
//
//  Created by Amin Siddiqui on 11/10/23.
//

import Foundation

struct ProductMockProvider: ProductProvider {
    
    func getProducts() async throws -> [Product] {
        let data = """
[
    {
          "id": 0,
          "title": "Test 1",
          "image_url": "https://appstorage.target.com/app-data/native-tha-images/1.jpg"
        },
        {
          "id": 1,
          "title": "Test 2",
          "image_url": "https://appstorage.target.com/app-data/native-tha-images/2.jpg"
        }
]
""".data(using: .utf8)!
        
        let products = try JSONDecoder().decode([Product].self, from: data)
        return products
    }
}
