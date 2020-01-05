//
//  ColorType.swift
//  Cafe
//
//  Created by Timur on 1/1/20.
//  Copyright © 2020 Timur. All rights reserved.
//

import UIKit

enum ColorType: String, Decodable {
    case red
    case blue
    case green

    var uiColor: UIColor {
        switch self {
        case .red:
            return .red
        case .blue:
            return .blue
        case .green:
            return .green
        }
    }
}

extension ColorType: CaseIterable {}
