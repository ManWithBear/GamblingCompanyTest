//
//  GoogleFactory.swift
//  UIBuilder
//
//  Created by Denis Bogomolov on 28/11/2018.
//  Copyright © 2018 bdk. All rights reserved.
//

import Foundation

class GoogleFactory { }
extension GoogleFactory: AbstractFactory {
    func makeButton() -> ButtonView {
        return ButtonView.loadFromNib(named: "GoogleButton")
    }
}
