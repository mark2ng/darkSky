//
//  ForecastBuilder.swift
//  darkSky
//
//  Created by Илья Маркин on 28/03/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import Foundation

class ForecastBuilder {

    static func build() -> ForecastViewController {
        let interactor = ForecastInteractor()

        let presenter = ForecastPresenter(with: interactor)
        interactor.output = presenter
        let vc = ForecastViewController(output: presenter)

        presenter.view = vc
        return vc
    }

}
