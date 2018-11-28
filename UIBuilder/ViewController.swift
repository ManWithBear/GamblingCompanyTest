//
//  ViewController.swift
//  UIBuilder
//
//  Created by Denis Bogomolov on 28/11/2018.
//  Copyright © 2018 bdk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let builder: ButtonBuilder
    let buttons: [ButtonType]

    init(_ builder: ButtonBuilder, buttons: [ButtonType]) {
        self.builder = builder
        self.buttons = buttons
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable, message: "This controller not supported in storyboards")
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func loadView() {
        let view = UIScrollView()
        view.backgroundColor = .lightGray

        let buttonViews = buttons.map {
            self.builder.build($0) { [weak self] in self?.showAlert(for: $0) }
        }

        var lastAnchor = view.topAnchor
        for btn in buttonViews {
            view.addSubview(btn)
            btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            btn.topAnchor.constraint(equalTo: lastAnchor, constant: 10).isActive = true
            lastAnchor = btn.bottomAnchor
        }
        if lastAnchor != view.topAnchor {
            lastAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        }

        // dummy view to constraint scrollview content width to full screen
        let widthView = UIView()
        widthView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(widthView)
        widthView.heightAnchor.constraint(equalToConstant: 0).isActive = true
        widthView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        widthView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        widthView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        widthView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true

        self.view = view
    }

    func showAlert(for type: ButtonType) {
        let alert = UIAlertController(title: type.rawValue, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
