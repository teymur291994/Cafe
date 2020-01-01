//
//  AppDelegate.swift
//  Cafe
//
//  Created by Timur on 12/21/19.
//  Copyright © 2019 Timur. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var services = Services()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        services.uiManager.setRootViewController()

        return true
    }
}

