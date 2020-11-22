//
//  ProductListViewController.swift
//  Classifieds
//
//  Created by Muhammad Nadeem on 20/11/2020.
//

import UIKit

class ProductListViewController: AbstractController {

    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!

    // MARK: Data
    private let productCellHeight = CGFloat(110)
    private let productCellIdentifier = "ProductTableViewCell"
    private var productList: Array<Product> = []
    var productListPresenter:ViewToPresenterProductListProtocol?

    // MARK: Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.accessibilityIdentifier = "homeView"
        tableView.accessibilityIdentifier = "productListTableView"

        // start loading indicator
        loader.startAnimating()
        
        // fetching product list from presenter
        productListPresenter?.startFetchingProductList()
    }
    
    // Customize view
    override func customizeView() {
        super.customizeView()
        // Customize titles for tab and navigation bar
        self.setNavBarTitle(title: "PRODUCT_LIST_TITLE".localized, color: AppColors.green)
        // Show nav bar border
        self.showNavBorder = true
        
        self.tableView.isHidden = true
    }
    
    // MARK: Functions
    /// stop loading indicator
    func stopLoadingIndicator(){
        loader.stopAnimating()
    }
}

// MARK: TableView Delegates & Datasource
extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return productListPresenter?.sections ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productListPresenter?.productCount ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return productCellHeight
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: productCellIdentifier, for: indexPath) as! ProductTableViewCell
        let product = productList[indexPath.row]        
        cell.populateCell(product: product)
        cell.accessibilityIdentifier = "productCell_\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = productList[indexPath.row]
        productListPresenter?.selectProduct(product: product)
    }
}

// MARK: Presenter to View Delegate
extension ProductListViewController: PresenterToViewProductListProtocol {
    
    func onProductListResponseSuccess(productList: Array<Product>) {
        self.productList = productList
        self.tableView.reloadData()
        let _ = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak self] (timer) in
            // stop loading indicator
            self?.stopLoadingIndicator()
            self?.tableView.isHidden = false
        }
    }
    
    func onProductListResponseFailed(error: String?) {
        print("show error messagae: \(error ?? "")")
        // stop loading indicator
        stopLoadingIndicator()
    }
}
