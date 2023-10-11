//
//  Providers.swift
//  TargetInterviewPoC
//
//  Created by Amin Siddiqui on 11/10/23.
//

import Foundation

enum Providers {
    
    static var productListProvider: ProductProvider {
        ProductAPIProvider()
    }
}
