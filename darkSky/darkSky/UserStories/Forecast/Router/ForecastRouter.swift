//
//  ForecastRouter.swift
//  darkSky
//
//  Created by Илья Маркин on 23/04/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import UIKit

class ForecastRouter {

    let viewController: ForecastViewController

    init(vc: ForecastViewController) {
        viewController = vc
    }

}

extension ForecastRouter: ForecastRouterProtocol {

    func navigate(to screen: WeatherScreen) {
        switch screen {
        case .detail(let weather, let city):
            let vc = DetailForecastBuilder.build(weather: weather, city: city)
            viewController.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}
