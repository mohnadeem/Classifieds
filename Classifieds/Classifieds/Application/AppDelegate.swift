//
//  AppDelegate.swift
//  Classifieds
//
//  Created by Muhammad Nadeem on 20/11/2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        /* Create ui-view-controller instance*/
        let productList = ProductListRouter.createModule()

        /* Initiating instance of ui-navigation-controller with view-controller */
        let navigationController = UINavigationController(rootViewController: productList)

        /* Setting up the root view-controller as ui-navigation-controller */
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

