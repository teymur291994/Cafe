//
//  UIView+Extension.swift
//  Cafe
//
//  Created by Timur on 1/4/20.
//  Copyright © 2020 Timur. All rights reserved.
//

import UIKit

extension UIView {
    // MARK: - public

    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }

    @discardableResult
    func fromNib<T: UIView>() -> T! {
        let contentView = (Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)!.first as? T)!
        addSubview(contentView)
        contentView.snp.makeConstraints { (maker) in
                maker.edges.equalToSuperview()
        }
        return contentView
    }
}
