//
//  ForecastContract.swift
//  darkSky
//
//  Created by Илья Маркин on 28/03/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import Foundation

// MARK: - Presenter
protocol ForecastViewOutput {
    func didLoad()
    func didRefresh()
}

protocol ForecastInteractorOutput: class {
    func forecastFetched(_ forecast: Forecast)
    func forecastDidNotFetched()
    func updateForecastFetched(_ forecast: Forecast)
}

protocol ForecastInteractorInput {
    func getForecast()
}

protocol ForecastViewInput {
    func setupTableView(with tvmodels: [DailyCellType],
                        cvmodels: [HourlyCellType], currently: Currently, timeZone: String)
    func showError()
}

enum DailyCellType {
    case regular(_ forecast: WeatherDaily)
}

enum HourlyCellType {
    case regular(_ forecast: WeatherHourly)
}

protocol CityViewControllerDelegate {
    func didSelectCity(_ city: City)//struct )
}
