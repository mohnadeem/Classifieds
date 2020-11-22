//
//  ProductListPresenterTests.swift
//  ClassifiedsTests
//
//  Created by Muhammad Nadeem on 22/11/2020.
//

import XCTest
@testable import Classifieds

class ProductListPresenterTests: XCTestCase {

    class MockInteracotr: ProductListInteractor {
        override func fetchProductList() {
            
        }
    }
    
    var presenter: ProductListPresenter?
    let mockInteractor = MockInteracotr()

    var fakeProduct: Product {
        let imageURL = "https://demo-app-photos-45687895456123.s3.amazonaws.com"
        let thumbURL = "https://demo-app-photos-45687895456123.s3.amazonaws.com/d94ea3ca5a1e424684edd1675776fd47-thumbnail"
        let createdAt = "2019-09-23 12:42:41.434262"
        let createdDate = DateHelper.getDateFromISOString(dateString: createdAt) ?? Date()
        return Product(id: "", createdAt: createdDate, price: "AED 800", name: "studio couch, day bed", uid: "efcbb9de74364f2b982623d4f03a0386", imageIdsList: ["d94ea3ca5a1e424684edd1675776fd47"], imageUrlsList: [imageURL], thumbsUrlsList: [thumbURL])
    }
    
    var fakeProducts: [Product] {
        return [fakeProduct]
    }
    
    override func setUp() {
        super.setUp()
        presenter = ProductListPresenter()
        presenter?.productListFetchSuccess(productList: fakeProducts)
        presenter?.productListFetchFailed(error: nil)
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testProductSectionIs1() {
        presenter?.productListFetchSuccess(productList: fakeProducts)
        XCTAssertEqual(presenter?.sections, 1)
    }
    
    func testProductCountIs1() {
        presenter?.productListFetchSuccess(productList: fakeProducts)
        XCTAssertEqual(presenter?.productCount, 1)
    }
    
    func testProductAtIndexIsInjectedProduct() {
        presenter?.productListFetchSuccess(productList: fakeProducts)
        let product = presenter?.product(at: 0)
        XCTAssertEqual(product?.createdAt, fakeProducts[0].createdAt)
        XCTAssertEqual(product?.name, fakeProducts[0].name)
        XCTAssertEqual(product?.price, fakeProducts[0].price)
        XCTAssertEqual(product?.uid, fakeProducts[0].uid)
        XCTAssertEqual(product?.imageIdsList, fakeProducts[0].imageIdsList)
        XCTAssertEqual(product?.thumbsUrlsList, fakeProducts[0].thumbsUrlsList)
        XCTAssertEqual(product?.imageUrlsList, fakeProducts[0].imageUrlsList)
    }
    
}

