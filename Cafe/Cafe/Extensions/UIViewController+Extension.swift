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

    func add(childVC: UIViewController, to container: UIView) {

        addChild(childVC)
        container.addSubview(childVC.view)
        childVC.view.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        childVC.didMove(toParent: self)
    }
}
