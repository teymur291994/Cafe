//
//  AddShiftViewController.swift
//  Cafe
//
//  Created by Timur on 1/2/20.
//  Copyright © 2020 Timur. All rights reserved.
//

import UIKit

protocol AddShiftDelegate: class {
    func addedShift(_ shift: Shift)
}

class AddShiftViewController: UIViewController {
    
    // MARK: - properties
    @IBOutlet private var addShiftTableViewContainer: UIView!
    weak var delegate: AddShiftDelegate!

    // MARK: - override

    override func viewDidLoad() {
        super.viewDidLoad()
        setupContent()
        setupViewHierarchy()
    }

    // MARK: - public

    static func instantiate(delegate: AddShiftDelegate) -> AddShiftViewController {
        let addShiftViewController = AddShiftViewController(nibName: "AddShiftViewController", bundle: nil)
        addShiftViewController.delegate = delegate
        return addShiftViewController
    }

    // MARK: - private

    private func setupViewHierarchy() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonPressed))
    }

    private func setupContent() {
        title = "addShiftScreenTitle".localized
    }

    // MARK: - actions

    @objc private func saveButtonPressed() {
        let shift = Shift(role: .cook, name: "", startDate: Date(), endDate: Date(), color: .blue)
        delegate.addedShift(shift)
        navigationController?.dismiss(animated: true)
    }
}
