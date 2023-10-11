//
//  Product.swift
//  TargetInterviewPoC
//
//  Created by Amin Siddiqui on 11/10/23.
//

import Foundation

/*
 {
       "id": 0,
       "title": "VIZIO D-Series 40\" Class 1080p Full-Array LED HD Smart TV",
       "aisle": "b2",
       "description": "fetch full product with details from https://api.target.com/mobile_case_study_deals/v1/deals/0",
       "image_url": "https://appstorage.target.com/app-data/native-tha-images/1.jpg",
       "regular_price": {
         "amount_in_cents": 22999,
         "currency_symbol": "$",
         "display_string": "$229.99"
       },
       "fulfillment": "Online",
       "availability": "In stock"
 }
 */

struct Product: Identifiable, Decodable {
    let id: Int
    let title: String
    let imageURLString: String
    let price: Price
    
    var imageURL: URL? {
        return URL(string: imageURLString)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case imageURLString = "image_url"
        case price = "regular_price"
    }
}
extension Product: Equatable {}

struct Price: Decodable {
    let displayString: String
    
    enum CodingKeys: String, CodingKey {
        case displayString = "display_string"
    }
}
extension Price: Equatable {}
