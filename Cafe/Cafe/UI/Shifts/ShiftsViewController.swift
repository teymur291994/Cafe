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
    private var shiftsTableViewController = ShiftsTableViewController()

    // MARK: - override

    override func viewDidLoad() {
        super.viewDidLoad()
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
        add(childVC: shiftsTableViewController, to: shiftsTableViewContainer)
    }

    private func setupStyle() {
        title = "shiftsScreenTitle".localized
    }

    // MARK: - actions

    @objc private func addButtonPressed() {
        let navigationController = UINavigationController(rootViewController: AddShiftViewController.instantiate(delegate: self))
        present(navigationController, animated: true, completion: nil)
    }
}

extension ShiftsViewController: AddShiftDelegate {
    func addedShift(_ shift: Shift) {
        shiftsTableViewController.addShift(shift)
    }
}
