//
//  NibLoadable.swift
//  UIBuilder
//
//  Created by Denis Bogomolov on 28/11/2018.
//  Copyright © 2018 bdk. All rights reserved.
//

import UIKit

protocol NibLoadable {
    static func loadFromNib(named: String) -> Self
}

extension NibLoadable where Self: UIView {
    static func loadFromNib(named: String) -> Self {
        let content = Bundle.main.loadNibNamed(named, owner: nil, options: nil)
        let view = content?.first { $0 is Self }
        guard let result = view as? Self else {
            fatalError("Fail to load \(String(describing: self)) from nib named \"\(named)\"")
        }
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }
}
