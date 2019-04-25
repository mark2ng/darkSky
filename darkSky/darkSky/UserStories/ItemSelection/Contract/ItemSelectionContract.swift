//
//  CityModelContract.swift
//  darkSky
//
//  Created by Илья Маркин on 11/04/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import Foundation

protocol ItemSelectionViewOutput {
    func didLoad()
}

protocol ItemSelectionInteractorOutput: class {
    func cityFetched(_ cities: [City])
}

protocol ItemSelectionInteractorInput {
    func getCity()
}

protocol ItemSelectionViewInput {
    func setupTableView(with cities: [City])
}

protocol ItemSelectionViewControllerDelegate {
    func didSelectCity(_ city: City)
}

protocol ItemSelectionServiceProtocol {
    func getCities() -> [City]
}
