//
//  WeatherNavigationController.swift
//  darkSky
//
//  Created by Илья Маркин on 28/03/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import UIKit

class WeatherNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc = ForecastBuilder.build()

        pushViewController(vc, animated: true)
    }

}
