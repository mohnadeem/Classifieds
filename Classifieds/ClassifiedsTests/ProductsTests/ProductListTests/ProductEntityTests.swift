//
//  ProductEntityTests.swift
//  ClassifiedsTests
//
//  Created by Muhammad Nadeem on 22/11/2020.
//

import XCTest
@testable import Classifieds

class ProductEntityTests: XCTestCase {

    func testProductSetGet() {
        let imageURL = "https://demo-app-photos-45687895456123.s3.amazonaws.com"
        
        let thumbURL = "https://demo-app-photos-45687895456123.s3.amazonaws.com/d94ea3ca5a1e424684edd1675776fd47-thumbnail"

        let createdAt = "2019-09-23 12:42:41.434262"
        let createdDate = DateHelper.getDateFromISOString(dateString: createdAt) ?? Date()
        let product = Product(id: "", createdAt: createdDate, price: "AED 800", name: "studio couch, day bed", uid: "efcbb9de74364f2b982623d4f03a0386", imageIdsList: ["d94ea3ca5a1e424684edd1675776fd47"], imageUrlsList: [imageURL], thumbsUrlsList: [thumbURL])

        XCTAssertEqual(product.name, "studio couch, day bed")
        XCTAssertEqual(product.createdAt, createdDate)
        XCTAssertEqual(product.price, "AED 800")
        XCTAssertEqual(product.uid, "efcbb9de74364f2b982623d4f03a0386")
        XCTAssertEqual(product.imageIdsList, ["d94ea3ca5a1e424684edd1675776fd47"])
        XCTAssertEqual(product.imageUrlsList, [imageURL])
        XCTAssertEqual(product.thumbsUrlsList, [thumbURL])

    }
}
