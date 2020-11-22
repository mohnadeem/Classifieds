//
//  ProductListPresenter.swift
//  Classifieds
//
//  Created by Muhammad Nadeem on 20/11/2020.
//

import Foundation

class ProductListPresenter: ViewToPresenterProductListProtocol {
    
    // MARK: Properties
    var view: PresenterToViewProductListProtocol?
    var interactor: PresenterToInteractorProductListProtocol?
    var router: PresenterToRouterProductListProtocol?
    
    private(set) var products: [Product]? {
        didSet {
            guard let products = products, !products.isEmpty else {
                view?.onProductListResponseFailed(error: "No product loaded")
                return
            }
            let sortedList = products.sorted(by: { $0.createdAt ?? Date() > $1.createdAt ?? Date() })
            view?.onProductListResponseSuccess(productList: sortedList)
        }
    }
    
    // MARK: Logic
    var sections: Int {
        return 1
    }

    var productCount: Int {
        return products?.count ?? 0
    }

    func product(at index: Int) -> Product? {
        return products?[index] ?? nil
    }

    /// fetching product list from interactor
    func startFetchingProductList() {
        interactor?.fetchProductList()
    }
    
    /// select product
    func selectProduct(product: Product) {
        router?.presentProductDetailView(product: product)
    }
}

// MARK: Interactor to Presenter delegate
extension ProductListPresenter: InteractorToPresenterProductListProtocol {
    func productListFetchSuccess(productList: Array<Product>) {
        let sortedList = productList.sorted(by: { $0.createdAt ?? Date() > $1.createdAt ?? Date() })
        products = sortedList
        view?.onProductListResponseSuccess(productList: sortedList)
    }
    
    func productListFetchFailed(error: String?) {
        view?.onProductListResponseFailed(error: error)
    }
}
