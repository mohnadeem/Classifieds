//
//  ProductListInteractor.swift
//  Classifieds
//
//  Created by Muhammad Nadeem on 20/11/2020.
//

import Foundation

class ProductListInteractor: PresenterToInteractorProductListProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterProductListProtocol?

    /// fetch product list from web
    func fetchProductList() {
        let requestURL = "\(AppConfig.appBaseURL)/default/dynamodb-writer"
        _ = ApiManager.shared.makeRequest(url: requestURL) { (responseObject, jsonResponse, error) in
            if let error = error {
                self.presenter?.productListFetchFailed(error: error.localizedDescription)
            } else {// success case
                guard let jsonResponse = jsonResponse else { return }
                var productList: Array<Product> = []
                // parse response
                if let data = jsonResponse["results"].array, data.count > 0 {
                    productList = data.map{Product(json: $0)}
                }
                self.presenter?.productListFetchSuccess(productList: productList)
            }
        }
    }
}
