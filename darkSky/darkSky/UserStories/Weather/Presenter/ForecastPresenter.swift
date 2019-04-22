//
//  ForecastPresenter.swift
//  darkSky
//
//  Created by Илья Маркин on 28/03/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import Foundation

class ForecastPresenter {

    let interactor: ForecastInteractorInput
    weak var view: ForecastViewController?

    init(with interactor: ForecastInteractorInput) {
        self.interactor = interactor
    }

    private func makeDailyCells(from forecast: Forecast) -> [DailyCellType] {
        return forecast.daily.data.map {
            DailyCellType.regular($0)
        }
    }

    private func makeHourlyCells(from forecast: Forecast) -> [HourlyCellType] {
        return forecast.hourly.data.map {
            HourlyCellType.regular($0)
        }
    }
}

extension ForecastPresenter: ForecastViewOutput {

    func didLoad() {
        interactor.getForecast()
    }

    func didRefresh() {
        interactor.getForecast()
    }

    func didLoadWith(newCity: City) {
        interactor.updateCity(with: newCity)
    }

}

extension ForecastPresenter: ForecastInteractorOutput {

    func forecastFetched(_ forecast: Forecast) {
        view?.setupTableView(
            with: makeDailyCells(from: forecast),
            cvmodels: makeHourlyCells(from: forecast),
            currently: forecast.currently, timeZone: forecast.timezone)
    }

    func forecastDidNotFetched() {
        view?.showError()
    }

    func updateForecastFetched(_ forecast: Forecast) {
//        view?.setupTableView(with: makeCells(from: forecast))
//        view?.setupTableView(forecast)
    }

}
