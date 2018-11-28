//
//  AppDelegate.swift
//  UIBuilder
//
//  Created by Denis Bogomolov on 28/11/2018.
//  Copyright © 2018 bdk. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let builder = DefaultButtonBuilder([
            .apple: AppleFactory(),
            .yahoo: YahooFactory(),
            .google: GoogleFactory()
            ]
        )
        let buttons: [ButtonType] = [
            .apple,
            .apple,
            .google,
            .yahoo,
            .apple
        ]
        window?.rootViewController = ViewController(builder, buttons: buttons)
        window?.makeKeyAndVisible()
        return true
    }
}
