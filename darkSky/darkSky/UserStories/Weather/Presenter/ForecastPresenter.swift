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

}

extension ForecastPresenter: ForecastViewOutput {

    func didLoad() {
        interactor.getForecast()
    }

    func didRefresh() {
        interactor.getForecast()
    }
}

extension ForecastPresenter: ForecastInteractorOutput {

    func forecastFetched(_ forecast: Forecast) {
        view?.setupTableView(forecast) // передать forecast
    }

}
