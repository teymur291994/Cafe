//
//  CustomDatePickerViewController.swift
//  Cafe
//
//  Created by Timur on 1/5/20.
//  Copyright © 2020 Timur. All rights reserved.
//

import UIKit

protocol CustomDatePickerViewControllerDelegate: class {
    func selected(_ date: Date)
}

class CustomDatePickerViewController: UIViewController {
    // MARK: - properties

    private lazy var customDatePicker = CustomDatePicker.instantiate(delegate: self)
    weak var delegate: CustomDatePickerViewControllerDelegate!

    // MARK: - override

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewHierarchy()
        setupStyle()
    }

    // MARK: - init

    init(delegate: CustomDatePickerViewControllerDelegate) {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - private

    private func setupStyle() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.35)
    }

    private func setupViewHierarchy() {
        showDatePicker()
    }

    private func showDatePicker() {
        view.addSubview(customDatePicker)
        customDatePicker.snp.makeConstraints { (maker) in
            maker.height.equalTo(254)
            maker.left.right.bottom.equalToSuperview()
        }
    }
}

extension CustomDatePickerViewController: CustomDatePickerDelegate {
    func closeButtonPressed() {
        dismiss(animated: true, completion: nil)
    }

    func selected(_ date: Date) {
        delegate.selected(date)
        dismiss(animated: true, completion: nil)
    }
}
