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
    func didLoadWith(newCity: City)
}

protocol ForecastInteractorOutput: class {
    func forecastFetched(_ forecast: Forecast)
    func forecastDidNotFetched()
    func updateForecastFetched(_ forecast: Forecast)
}

protocol ForecastInteractorInput {
    func getForecast()
    func updateForecast()
    func updateCity(with city: City)
}

protocol ForecastViewInput {
    func setupTableView(with tvmodels: [DailyCellType],
                        cvmodels: [HourlyCellType], currently: Currently, timeZone: String)
    func showError()
}
