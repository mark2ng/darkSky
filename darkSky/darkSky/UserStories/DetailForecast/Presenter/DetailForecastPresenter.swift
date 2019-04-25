//
//  File.swift
//  darkSky
//
//  Created by Илья Маркин on 23/04/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import Foundation

class DetailForecastPresenter {
    let interactor: DetailForecastInteractor
    weak var view: DetailForecastViewInput?

    init(with interactor: DetailForecastInteractor) {
        self.interactor = interactor
    }

    private func makeHourlyCells(from forecast: Forecast) -> [HourlyCellType] {
        return forecast.hourly.data.map {
            HourlyCellType.regular($0)
        }
    }

}

extension DetailForecastPresenter: DetailForecastViewOutput {
    func didLoad() {
        interactor.getForecast()
    }
}

extension DetailForecastPresenter: DetailForecastInteractorOutput {
    func forecastFetched(_ forecast: Forecast) {
        view?.setupData(with: makeHourlyCells(from: forecast))
    }
}
