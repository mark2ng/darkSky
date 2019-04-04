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
}

protocol ForecastInteractorOutput: class {
    func forecastFetched(_ forecast: Forecast)
}

protocol ForecastInteractorInput {
    func getForecast()
}

protocol ForecastViewInput {
    func setupTableView(_ forecast: Forecast)
}
