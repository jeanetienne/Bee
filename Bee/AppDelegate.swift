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
        if let appWindow = self.window {
            let firstModule = SpellingRouter.createModule()
            appWindow.rootViewController = firstModule
            appWindow.makeKeyAndVisible()
        }

        return true
    }

}
