//
//  FavouriteProductListView.swift
//  TargetInterviewPoC
//
//  Created by Amin Siddiqui on 11/10/23.
//

import SwiftUI

struct FavouriteProductListView: View {
    
    @State var products: [ProductViewModel]
    
    init(products: [ProductViewModel]) {
        self.products = products
    }
    
    var body: some View {
        if products.isEmpty {
            Text("You have not favourited any product")
        } else {
            List(products) { productViewModel in
                ProductCellView(viewModel: productViewModel)
            }
        }
    }
}
