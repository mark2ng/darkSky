//
//  ForecastInteractor.swift
//  darkSky
//
//  Created by Илья Маркин on 28/03/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import Foundation

class ForecastInteractor {

    weak var output: ForecastInteractorOutput?
    let darkSky = DarkSkyService()
}

extension ForecastInteractor: ForecastInteractorInput {

    func getForecast() {
        darkSky.getTemperature({ [unowned self] forecast in
            self.output?.forecastFetched(forecast)
        })
    }

    func updateForecast() {
        darkSky.getTemperature({ [unowned self] forecast in
            self.output?.forecastFetched(forecast)
        })
    }

}
