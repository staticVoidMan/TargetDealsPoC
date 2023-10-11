//
//  HomeViewModelTests.swift
//  TargetInterviewPoCTests
//
//  Created by Amin Siddiqui on 11/10/23.
//

import XCTest
@testable import TargetInterviewPoC

//scrolling; cancel old image download

// no products - empty array
// 1 product - same product in array
/// 2 products
// refresh api, the list should reset
// pagination, the list should append

final class HomeViewModelTests: XCTestCase {
    
    func testNoProductsInList() async {
        let provider = ProductStubProvider(products: [])
        let sut = HomeViewModel(provider: provider)
        
        await sut.refresh()
        XCTAssertEqual(sut.products.count, 0)
    }
    
    func testOneProductsInList() async {
        let product = Product(id: 1, title: "Title 1", imageURLString: "Image 1", price: Price(displayString: "$1"))
        let provider = ProductStubProvider(products: [product])
        let sut = HomeViewModel(provider: provider)
        
        await sut.refresh()
        XCTAssertEqual(sut.products.count, 1)
        XCTAssertEqual(sut.products.first?.product, product)
    }
    
    func testCanFavouriteAndUnfavouriteProduct() async {
        let product = Product(id: 1, title: "Title 1", imageURLString: "Image 1", price: Price(displayString: "$1"))
        let provider = ProductStubProvider(products: [product])
        let sut = HomeViewModel(provider: provider)
        
        await sut.refresh()
        sut.products.first?.toggleFavourite()
        XCTAssertEqual(sut.products.first?.isFavourite, true)
        
        sut.products.first?.toggleFavourite()
        XCTAssertEqual(sut.products.first?.isFavourite, false)
    }
}














