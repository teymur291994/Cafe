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
        setupViewHierarchy()
        setupStyle()
    }

    // MARK: - public

    static func instantiate() -> ShiftsViewController {
        return ShiftsViewController(nibName: "ShiftsViewController", bundle: nil)
    }

    // MARK: - private

    private func setupViewHierarchy() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
    }

    private func setupBehaviour() {
        add(childVC: ShiftsTableViewController(), to: shiftsTableViewContainer)
    }

    private func setupStyle() {
        title = "shiftsScreenTitle".localized
    }

    // MARK: - actions

    @objc private func addButtonPressed() {
        present(AddShiftViewController.instantiate(), animated: true, completion: nil)
    }
}
