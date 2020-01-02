//
//  AddShiftViewController.swift
//  Cafe
//
//  Created by Timur on 1/2/20.
//  Copyright © 2020 Timur. All rights reserved.
//

import UIKit

class AddShiftViewController: UIViewController {
    
    // MARK: - properties
    @IBOutlet private var addShiftTableViewContainer: UIView!

    // MARK: - override

    override func viewDidLoad() {
        super.viewDidLoad()
        setupContent()
    }

    // MARK: - public

    static func instantiate() -> AddShiftViewController {
        return AddShiftViewController(nibName: "AddShiftViewController", bundle: nil)
    }

    // MARK: - private

    private func setupContent() {
        title = "addShiftScreenTitle".localized
    }
}
