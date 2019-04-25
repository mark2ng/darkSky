//
//  AppDelegate.swift
//  darkSky
//
//  Created by Илья Маркин on 19/03/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var router: MainRouter?

    func application(_ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds).with {
            $0.backgroundColor = .white
            $0.makeKeyAndVisible()
        }
        router = MainRouter(window: window)
        return true
    }

}
