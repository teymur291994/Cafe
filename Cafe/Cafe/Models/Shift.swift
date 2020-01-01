//
//  Shift.swift
//  Cafe
//
//  Created by Timur on 1/1/20.
//  Copyright © 2020 Timur. All rights reserved.
//

import Foundation

struct Shift: Decodable {
    var role: RoleType
    var name: String
    var startDate: Date
    var endDate: Date
    var color: ColorType
}
