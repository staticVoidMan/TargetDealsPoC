//
//  ProductCellView.swift
//  TargetInterviewPoC
//
//  Created by Amin Siddiqui on 11/10/23.
//

import SwiftUI

struct ProductCellView: View {
    
    @ObservedObject var viewModel: ProductViewModel
    
    var body: some View {
        HStack(spacing: 8) {
            AsyncImage(url: viewModel.product.imageURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 64)
            } placeholder: {
                ProgressView()
            }

            VStack(alignment: .leading) {
                Text(viewModel.product.title)
                Spacer()
                Text(viewModel.product.price.displayString)
            }
            .frame(maxWidth: .infinity)
            
            Button {
                viewModel.toggleFavourite()
            } label: {
                Image(systemName: viewModel.isFavourite ? "heart.fill" : "heart")
            }
        }
    }
}
