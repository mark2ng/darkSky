//
//  File.swift
//  darkSky
//
//  Created by Илья Маркин on 23/04/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import Foundation

protocol DetailForecastViewOutput {
    func didLoad()
}

protocol DetailForecastViewInput: class {
    func setupData(with model: [HourlyCellType])
}

protocol DetailForecastInteractorOutput: class {
    func forecastFetched(_ forecast: Forecast)
}

protocol DetailForecastInteractorInput {
    func getForecast()
}
