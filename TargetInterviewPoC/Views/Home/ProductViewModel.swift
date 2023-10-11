//
//  ProductViewModel.swift
//  TargetInterviewPoC
//
//  Created by Amin Siddiqui on 11/10/23.
//

import Foundation

final class ProductViewModel: ObservableObject, Identifiable {
    var id: Int { product.id }
    
    let product: Product
    @Published var isFavourite: Bool
    
    init(product: Product, isFavourite: Bool) {
        self.product = product
        self.isFavourite = isFavourite
    }
    
    func toggleFavourite() {
        isFavourite.toggle()
    }
}

extension ProductViewModel: Hashable {
    static func == (lhs: ProductViewModel, rhs: ProductViewModel) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
