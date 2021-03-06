//
//  AppDelegate.swift
//  StackTest
//
//  Created by Florian LUDOT on 1/6/18.
//  Copyright © 2018 Florian LUDOT. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()

        window?.rootViewController = UINavigationController(rootViewController: LFMainViewController())
       
        return true
    }

}

