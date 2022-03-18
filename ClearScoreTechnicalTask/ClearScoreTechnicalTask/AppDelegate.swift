//
//  AppDelegate.swift
//  ClearScoreTechnicalTask
//
//  Created by YORK CHAN on 18/3/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        startInitialViewController()
        
        return true
    }
    
    func startInitialViewController() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let nav = UINavigationController()
        let dashboardView = DashboardViewController(nibName: "DashboardViewController", bundle: nil)
        nav.viewControllers = [dashboardView]
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
    }
}

