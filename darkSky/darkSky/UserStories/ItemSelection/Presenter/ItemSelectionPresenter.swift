//
//  CityModelPresenter.swift
//  darkSky
//
//  Created by Илья Маркин on 11/04/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import Foundation

class ItemSelectionPresenter {

    let interactor: ItemSelectionInteractorInput
    weak var view: ItemSelectionViewController?

    init(with interactor: ItemSelectionInteractorInput) {
        self.interactor = interactor
    }

//    private func makeCityCell(from city: City) -> [CityCellType] {
//        return city.map {
//            CityCellType.regular($0)
//        }
//    }

}

extension ItemSelectionPresenter: ItemSelectionViewOutput {
    func didLoad() {
        interactor.getCity()
    }
}

extension ItemSelectionPresenter: ItemSelectionInteractorOutput {
    func cityFetched(_ cities: [City]) {
        view?.setupTableView(with: cities)
    }
}
