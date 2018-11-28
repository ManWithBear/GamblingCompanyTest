//
//  ButtonView.swift
//  UIBuilder
//
//  Created by Denis Bogomolov on 28/11/2018.
//  Copyright © 2018 bdk. All rights reserved.
//

import UIKit

enum ButtonType: String {
    case apple, yahoo, google
}

class ButtonView: UIView {

    var onTap: (() -> Void)?

    @IBAction func buttonTap() {
        onTap?()
    }
}
