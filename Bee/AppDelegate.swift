//
//  AppDelegate.swift
//  Bee
//
//  Created by Jean-Étienne on 6/11/16.
//  Copyright © 2016 Jean-Étienne. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        if let appWindow = window {
            let firstModule = SpellingRouter.entryPoint()
            let navigationController = UINavigationController(rootViewController: firstModule)
            navigationController.setNavigationBarHidden(true, animated: false)
            appWindow.rootViewController = navigationController
            appWindow.makeKeyAndVisible()
        }

        return true
    }

}
