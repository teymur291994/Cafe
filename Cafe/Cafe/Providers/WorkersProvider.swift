//
//  WorkersProvider.swift
//  Cafe
//
//  Created by Timur on 1/1/20.
//  Copyright © 2020 Timur. All rights reserved.
//

import Foundation

typealias Shifts = (_ shifts: [Shift]?) -> Void

struct WorkersProvider {
    var parsingManager: ParsingManager

    // MARK: - public

    func shifts(shiftsCompletion: Shifts) {
        if let path = Bundle.main.path(forResource: "Shifts", ofType: "json") {
            return parsingManager.decode(for: path, shiftsCompletion: shiftsCompletion)
        }
        shiftsCompletion(nil)
    }
}
