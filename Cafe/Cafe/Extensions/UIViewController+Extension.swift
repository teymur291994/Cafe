//
//  UIViewController+Extension.swift
//  Cafe
//
//  Created by Timur on 1/1/20.
//  Copyright © 2020 Timur. All rights reserved.
//

import UIKit
import SnapKit

extension UIViewController {
    // MARK: - public

    func add(childVC: UIViewController, to container: UIView) {

        addChild(childVC)
        container.addSubview(childVC.view)
        childVC.view.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        childVC.didMove(toParent: self)
    }

    func alert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "alertTitleOK".localized, style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
