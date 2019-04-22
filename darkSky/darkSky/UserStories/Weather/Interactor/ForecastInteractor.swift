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
    var currentCity = City(name: "Москва", latitude: 56, longitude: 38)
}

extension ForecastInteractor: ForecastInteractorInput {

    func getForecast() {
        darkSky.getTemperature(city: currentCity, { [unowned self] forecast in
            self.output?.forecastFetched(forecast)
            }, onError: {
                self.output?.forecastDidNotFetched()
        })
    }

    func updateForecast() {
        darkSky.getTemperature(city: currentCity, { [unowned self] forecast in
            self.output?.forecastFetched(forecast)
            }, onError: {
                self.output?.forecastDidNotFetched()
        })
    }

    func updateCity(with city: City) {
        currentCity = city
        getForecast()
    }

}
