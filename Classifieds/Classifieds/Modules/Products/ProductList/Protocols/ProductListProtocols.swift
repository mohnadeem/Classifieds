//
//  ProductListProtocols.swift
//  Classifieds
//
//  Created by Muhammad Nadeem on 21/11/2020.
//

import Foundation

/// View to presenter product list protocol
protocol ViewToPresenterProductListProtocol:class{
    var sections: Int { get }
    var productCount: Int { get }
    func product(at index: Int) -> Product?
    var view: PresenterToViewProductListProtocol? {get set}
    var interactor: PresenterToInteractorProductListProtocol? {get set}
    var router: PresenterToRouterProductListProtocol? {get set}
    func startFetchingProductList()
    func selectProduct(product: Product)
}

/// Presenter to view product list protocol
protocol PresenterToViewProductListProtocol:class {
    func onProductListResponseSuccess(productList:Array<Product>)
    func onProductListResponseFailed(error:String?)
}

/// Presenter to interacter product list protocol
protocol PresenterToInteractorProductListProtocol:class {
    var presenter:InteractorToPresenterProductListProtocol? {get set}
    func fetchProductList()
}

/// Interactor to presenter product list protocol
protocol InteractorToPresenterProductListProtocol:class {
    func productListFetchSuccess(productList:Array<Product>)
    func productListFetchFailed(error: String?)
}

/// Presenter to router product list protocol
protocol PresenterToRouterProductListProtocol:class {
    static func createModule()->ProductListViewController
    func presentProductDetailView(product: Product)
}
