//
//  HomeView.swift
//  TargetInterviewPoC
//
//  Created by Amin Siddiqui on 11/10/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel =
        .init(provider: Providers.productListProvider)
    
    var body: some View {
        List(viewModel.products) { productViewModel in
            ProductCellView(viewModel: productViewModel)
        }
        .navigationTitle("Products")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(value: viewModel.favouriteProducts) {
                    Image(systemName: "heart.circle")
                }
            }
        }
        .navigationDestination(for: [ProductViewModel].self) { _ in
            FavouriteProductListView(products: viewModel.favouriteProducts)
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}
