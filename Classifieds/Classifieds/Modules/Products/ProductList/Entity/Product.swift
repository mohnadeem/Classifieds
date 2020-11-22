//
//  Product.swift
//  Classifieds
//
//  Created by Muhammad Nadeem on 20/11/2020.
//

import Foundation
import SwiftyJSON

// MARK: - Product
class Product: BaseModel {
    // MARK: Keys
    private let kCreatedAtKey = "created_at"
    private let kPriceKey = "price"
    private let kNameKey = "name"
    private let kUidKey = "uid"
    private let kImageIdsListKey = "image_ids"
    private let kImageUrlsListKey = "image_urls"
    private let kThumbsUrlsListKey = "image_urls_thumbnails"

    // MARK: Properties
    @objc public var createdAt: Date?
    @objc public var price: String?
    @objc public var name: String?
    @objc public var uid: String?
    @objc public var imageIdsList: [String]?
    @objc public var imageUrlsList: [String]?
    @objc public var thumbsUrlsList: [String]?

    /**
     Initates the instance based on the JSON that was passed.
     - parameter json: JSON object from SwiftyJSON.
     - returns: An initalized instance of the class.
     */
    public required init(json: JSON) {
        super.init(json: json)
        if let dateString = json[kCreatedAtKey].string {
            createdAt = DateHelper.getDateFromISOString(dateString: dateString)
        }
        price = json[kPriceKey].string
        name = json[kNameKey].string
        uid = json[kUidKey].string
        if let data = json[kImageIdsListKey].array {
            imageIdsList  = data.map{$0.stringValue}
        }
        if let data = json[kImageUrlsListKey].array {
            imageUrlsList  = data.map{$0.stringValue}
        }
        if let data = json[kThumbsUrlsListKey].array {
            thumbsUrlsList  = data.map{$0.stringValue}
        }
    }
    
    /**
     Dependency Injection (DI)
     - parameter id: the id of the product
     - parameter createdAt: the creation date of the product
     - parameter price: the price of the product
     - parameter name: the name of the product
     - parameter uid: the uid of the product
     - parameter imageIdsList: the list of image ids
     - parameter imageUrlsList: the list of images urls
     - parameter thumbsUrlsList: the list of thumbnails urls
     - returns: An initalized instance of the class.
     */
    public init(id: String = "", createdAt: Date = Date(), price: String = "", name: String = "", uid: String = "", imageIdsList: [String] = [], imageUrlsList: [String] = [], thumbsUrlsList: [String] = []) {
        super.init(id: id)
        self.createdAt = createdAt
        self.price = price
        self.name = name
        self.uid = uid
        self.imageIdsList = imageIdsList
        self.imageUrlsList = imageUrlsList
        self.thumbsUrlsList = thumbsUrlsList
    }
    
    /**
     Generates description of the object in the form of a NSDictionary.
     - returns: A Key value pair containing all valid values in the object.
     */
    public override func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = super.dictionaryRepresentation()
        // created date
        if let value = createdAt {
            dictionary[kCreatedAtKey] = DateHelper.getISOStringFromDate(value)
        }
        // price
        dictionary[kPriceKey] = price
        // name
        dictionary[kNameKey] = name
        // uid
        dictionary[kUidKey] = uid
        // list of image IDS
        if let valueList = imageIdsList {
            dictionary[kImageIdsListKey] = valueList
        }
        // list of images
        if let valueList = imageUrlsList {
            dictionary[kImageUrlsListKey] = valueList
        }
        // list of thumbnails
        if let valueList = thumbsUrlsList {
            dictionary[kThumbsUrlsListKey] = valueList
        }
        return dictionary
    }
}

