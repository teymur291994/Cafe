//
//  ParsingManager.swift
//  Cafe
//
//  Created by Timur on 1/1/20.
//  Copyright © 2020 Timur. All rights reserved.
//

import Foundation

class ParsingManager {
    // MARK: - properties
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZZZ"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter
    }()

    // MARK: - public

    func decode(for path: String, shiftsCompletion: Shifts) {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            let jsonResult = try decoder.decode(ShiftsResult.self, from: data)
            shiftsCompletion(jsonResult.shifts)
        } catch let error {
            print("error: ", error)
            shiftsCompletion(nil)
        }
    }
}
