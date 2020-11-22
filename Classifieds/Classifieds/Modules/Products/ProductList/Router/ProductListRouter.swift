//
//  ProductListRouter.swift
//  Classifieds
//
//  Created by Muhammad Nadeem on 20/11/2020.
//

import Foundation
import UIKit

class ProductListRouter: PresenterToRouterProductListProtocol{
    
    static func createModule() -> ProductListViewController {
        let view = ProductListRouter.mainstoryboard.instantiateViewController(withIdentifier: "ProductListViewController") as! ProductListViewController
        
        let presenter = ProductListPresenter()
        let interactor = ProductListInteractor()
        let router = ProductListRouter()
        
        view.productListPresenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func presentProductDetailView(product: Product) {
        let detailVC = ProductDetailViewController(nibName: "ProductDetail", bundle: Bundle.main)
        detailVC.product = product
        UIApplication.visibleNavigationController()?.pushViewController(detailVC, animated: true)
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
}
