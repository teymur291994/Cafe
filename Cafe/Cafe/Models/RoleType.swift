//
//  RoleType.swift
//  Cafe
//
//  Created by Timur on 1/1/20.
//  Copyright © 2020 Timur. All rights reserved.
//

enum RoleType: String, Decodable {
    case waiter = "Waiter"
    case prep = "Prep"
    case frontOfHouse = "Front of House"
    case cook = "Cook"
}

extension RoleType: CaseIterable {}
