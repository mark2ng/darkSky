//
//  CityModelInteractor.swift
//  darkSky
//
//  Created by Илья Маркин on 11/04/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import Foundation

class ItemSelectionInteractor {

    weak var output: ItemSelectionInteractorOutput?
    let city = ItemSelectionService()

}

extension ItemSelectionInteractor: ItemSelectionInteractorInput {

    func getCity() {
        let cities = city.getCities()
        self.output?.cityFetched(cities)
    }

}
