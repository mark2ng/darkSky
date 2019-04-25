//
//  WeatherNavigationController.swift
//  darkSky
//
//  Created by Илья Маркин on 28/03/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import UIKit

enum WeatherScreen {
    case forecast
    case detail(weather: WeatherDaily, city: City)
}

class MainRouter {
    var navigationController: UINavigationController?

    init(window: UIWindow?) {
        navigationController = UINavigationController()
        window?.rootViewController = navigationController
        navigate(to: .forecast)
    }

    func navigate(to screen: WeatherScreen) {
        switch screen {
        case .forecast:
            let vc = ForecastBuilder.build()
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }

}

//class WeatherNavigationController: UINavigationController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let vc = ForecastBuilder.build()
//
//        pushViewController(vc, animated: true)
//    }
//
//}
