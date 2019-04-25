//
//  DetailForecastBuilder.swift
//  darkSky
//
//  Created by Илья Маркин on 23/04/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import Foundation

class DetailForecastBuilder {

    static func build(weather: WeatherDaily, city: City) -> DetailForecastViewController {
        let interactor = DetailForecastInteractor(weather: weather, city: city)

        let presenter = DetailForecastPresenter(with: interactor)
        interactor.output = presenter

        let vc = DetailForecastViewController(output: presenter)
        presenter.view = vc

        return vc
    }

}
