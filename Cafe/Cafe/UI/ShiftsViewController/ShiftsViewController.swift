//
//  ShiftsViewController.swift
//  Cafe
//
//  Created by Timur on 1/1/20.
//  Copyright © 2020 Timur. All rights reserved.
//

import UIKit

class ShiftsViewController: UIViewController {
    // MARK: - properties

    @IBOutlet private weak var shiftsTableViewContainer: UIView!

    // MARK: - override

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBehaviour()
    }

    // MARK: - private

    private func setupBehaviour() {
        add(childVC: UIViewController(), to: shiftsTableViewContainer)
    }
}
