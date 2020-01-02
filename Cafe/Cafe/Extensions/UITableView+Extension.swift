//
//  UITableView+Extension.swift
//  Cafe
//
//  Created by Timur on 1/2/20.
//  Copyright © 2020 Timur. All rights reserved.
//

import UIKit

extension UITableView {
    func registerCell<T: UITableViewCell>(_: T.Type) where T: ReusableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: String(describing: T.self), bundle: bundle)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T:ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to Dequeue Reusable Table View Cell")
        }

        return cell
    }
}
