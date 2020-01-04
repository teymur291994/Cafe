//
//  ShiftsTableViewCell.swift
//  Cafe
//
//  Created by Timur on 1/2/20.
//  Copyright © 2020 Timur. All rights reserved.
//

import UIKit

class ShiftsTableViewCell: UITableViewCell {
    // MARK: - properties

    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var occupationLabel: UILabel!
    @IBOutlet private var shiftLabel: UILabel!
    @IBOutlet private var colorView: UIView!

    // MARK: - override

    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
    }

    // MARK: - public

    func configure(shift: Shift) {
        colorView.backgroundColor = shift.color.uiColor
        nameLabel.text = shift.name
        occupationLabel.text = shift.role.rawValue
        shiftLabel.text = shiftLabelText(for: shift)
    }

    // MARK: - private

    private func setupStyle() {
        colorView.layer.cornerRadius = colorView.frame.size.width/2
        colorView.clipsToBounds = true
    }

    private func shiftLabelText(for shift: Shift) -> String {
        let startDateFormatter = DateFormatter()
        startDateFormatter.dateFormat = "EEE, MMMM d h-"
        let startDateString = startDateFormatter.string(from: shift.startDate)

        let endDateFormatter = DateFormatter()
        endDateFormatter.dateFormat = "h a"
        let endHourString = endDateFormatter.string(from: shift.endDate)

        return "\(startDateString)\(endHourString)"
    }
}

extension ShiftsTableViewCell: ReusableView {}
