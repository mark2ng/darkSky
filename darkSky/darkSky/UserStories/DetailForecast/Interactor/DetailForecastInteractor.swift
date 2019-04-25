//
//  DetailForecastInteractor.swift
//  darkSky
//
//  Created by Илья Маркин on 23/04/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import Foundation

class DetailForecastInteractor {

    weak var output: DetailForecastInteractorOutput?
    let forecast = DarkSkyService()
    let weather: WeatherDaily
    let city: City

    init(weather: WeatherDaily, city: City) {
        self.weather = weather
        self.city = city
    }

}

extension DetailForecastInteractor: DetailForecastInteractorInput {
    func getForecast() {
        forecast.getTemperature(city: city, date: weather.timeAsInt, { [unowned self] (forecast) in
            self.output?.forecastFetched(forecast)
        }) {
        }
    }
}
