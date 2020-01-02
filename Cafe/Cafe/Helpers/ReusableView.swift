//
//  ReusableView.swift
//  Cafe
//
//  Created by Timur on 1/2/20.
//  Copyright © 2020 Timur. All rights reserved.
//

import UIKit

protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
