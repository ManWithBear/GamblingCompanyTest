//
//  ButtonBuilder.swift
//  UIBuilder
//
//  Created by Denis Bogomolov on 28/11/2018.
//  Copyright © 2018 bdk. All rights reserved.
//

import UIKit

protocol ButtonBuilder {
    func build(_ type: ButtonType, onTap: @escaping (ButtonType) -> Void) -> UIView
}

class DefaultButtonBuilder {
    let configuration: [ButtonType: AbstractFactory]

    init(_ configuration: [ButtonType: AbstractFactory]) {
        self.configuration = configuration
    }
}

extension DefaultButtonBuilder: ButtonBuilder {
    func build(_ type: ButtonType, onTap: @escaping (ButtonType) -> Void) -> UIView {
        guard let factory = configuration[type] else {
            assertionFailure("Builder not configured to build \"\(type)\" type")
            return UIView()
        }
        let btn = factory.makeButton()
        btn.onTap = { onTap(type) }
        return btn
    }
}
