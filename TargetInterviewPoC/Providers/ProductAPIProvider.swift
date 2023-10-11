//
//  ProductAPIProvider.swift
//  TargetInterviewPoC
//
//  Created by Amin Siddiqui on 11/10/23.
//

import Foundation

struct ProductAPIProvider: ProductProvider {
    
    let manager = NetworkManager()
    
    private struct ResponseWrapper: Decodable {
        let products: [Product]
    }
    
    func getProducts() async throws -> [Product] {
//        let urlString = "https://api.target.com/mobile_case_study_deals/v1/deals"
//        
//        guard let url = URL(string: urlString)
//        else { throw NetworkError.invaldURL(string: urlString) }
//        
//        let (data, _) = try await URLSession.shared.data(from: url)
//        let result = try JSONDecoder().decode(ResponseWrapper.self, from: data)
//        return result.products
        
        let request = ProductListRequest()
        let result: ResponseWrapper = try await manager.send(request)
        return result.products
    }
}
