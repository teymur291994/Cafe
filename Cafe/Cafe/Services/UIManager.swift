//
//  UIManager.swift
//  Cafe
//
//  Created by Timur on 1/1/20.
//  Copyright © 2020 Timur. All rights reserved.
//

import UIKit

struct UIManager {
    // MARK: - properties

    private var window = UIWindow(frame: UIScreen.main.bounds)
    private var rootViewController: UINavigationController {
        return window.rootViewController as! UINavigationController
    }

    // MARK: - public

    func setRootViewController() {
        let shiftsViewController = ShiftsViewController(nibName: "ShiftsViewController", bundle: nil)
        let navigationController = UINavigationController(rootViewController: shiftsViewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
