//
//  AddShiftsTableViewCell.swift
//  Cafe
//
//  Created by Timur on 1/4/20.
//  Copyright © 2020 Timur. All rights reserved.
//

import UIKit

protocol AddShiftsTableViewCellDelegate: class {
    func dateButtonPressed(in cell: DatePickerTableViewCell)
}

class DatePickerTableViewCell: UITableViewCell {
    // MARK: - properties

    @IBOutlet private var dateButton: UIButton!
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

    func setDateValue(_ dateString: String) {
        dateButton.setTitle(dateString, for: .normal)
    }

    // MARK: - private

    private func setupStyle() {
        dateButton.layer.borderWidth = 1
    }

    // MARK: - actions

    @IBAction private func dateButtonPressed() {
        delegate.dateButtonPressed(in: self)
    }
}

extension DatePickerTableViewCell: ReusableView {}
