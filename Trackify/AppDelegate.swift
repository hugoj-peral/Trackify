//
//  AppDelegate.swift
//  Trackify
//
//  Created by Hugo Peral on 19/11/2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        PopulateDataManager(coreDataStack: CoreDataStack.shared).populateAppIfNeeded()
        
        let dashboardController: DashboardViewController = AppAssembler().resolve()
        let navigationController = UINavigationController(rootViewController: dashboardController)
        window = window ?? UIWindow.makeWindow(frame: UIScreen.main.bounds, rootViewController: navigationController)
        window?.makeKeyAndVisible()
        
        return true
    }
}

