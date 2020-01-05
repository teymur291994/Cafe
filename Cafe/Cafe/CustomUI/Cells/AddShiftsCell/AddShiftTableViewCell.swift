//
//  AddShiftsTableViewCell.swift
//  Cafe
//
//  Created by Timur on 1/4/20.
//  Copyright © 2020 Timur. All rights reserved.
//

import UIKit

protocol AddShiftsTableViewCellDelegate: class {
    func optionButtonPressed(in cell: AddShiftTableViewCell)
}

class AddShiftTableViewCell: UITableViewCell {
    // MARK: - properties

    @IBOutlet private var optionButton: UIButton!
    @IBOutlet private var dateLabel: UILabel!
    weak var delegate: AddShiftsTableViewCellDelegate!

    // MARK: - override

    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
    }

    // MARK: - public

    func configure(title: String, delegate: AddShiftsTableViewCellDelegate) {
        dateLabel.text = title
        self.delegate = delegate
    }

    func setValue(_ dateString: String) {
        optionButton.setTitle(dateString, for: .normal)
    }

    // MARK: - private

    private func setupStyle() {
        optionButton.layer.borderWidth = 1
    }

    // MARK: - actions

    @IBAction private func optionButtonPressed() {
        delegate.optionButtonPressed(in: self)
    }
}

extension AddShiftTableViewCell: ReusableView {}
