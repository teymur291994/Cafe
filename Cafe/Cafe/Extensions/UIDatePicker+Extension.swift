//
//  UIDatePicker+Extension.swift
//  Cafe
//
//  Created by Timur on 1/4/20.
//  Copyright © 2020 Timur. All rights reserved.
//

import UIKit

extension UIDatePicker {
    // MARK: - public

    func setCurrentDateAsMin() {
        let addedMinute = 1
        let datePickerMaximumDate = calendar.date(byAdding: .minute, value: -addedMinute, to: Date())
        minimumDate = datePickerMaximumDate
    }
}
