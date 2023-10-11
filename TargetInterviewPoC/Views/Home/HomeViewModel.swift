//
//  HomeViewModel.swift
//  TargetInterviewPoC
//
//  Created by Amin Siddiqui on 11/10/23.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published var products: [ProductViewModel] = []
    
    var favouriteProducts: [ProductViewModel] {
        products.filter { $0.isFavourite }
    }
    
    private let provider: ProductProvider
    
    init(provider: ProductProvider) {
        self.provider = provider
        Task {
            await refresh()
        }
    }
    
    @MainActor
    func refresh() async {
        do {
            products = try await provider
                .getProducts()
                .map { ProductViewModel(product: $0, isFavourite: false) }
        } catch {
            print(error)
        }
    }
}
