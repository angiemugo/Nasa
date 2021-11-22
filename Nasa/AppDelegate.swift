//
//  AppDelegate.swift
//  Nasa
//
//  Created by Angie Mugo on 21/11/2021.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        let coordinator = NasaCoordinator(UINavigationController())
        let viewController = UINavigationController(rootViewController: coordinator.start())
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
}

