//
//  CityLocalStorage.swift
//  darkSky
//
//  Created by Илья Маркин on 13/04/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import Foundation

class ItemSelectionService: ItemSelectionServiceProtocol {

    func getCities() -> [City] {
        let moscowString = NSLocalizedString("Moscow", comment: "")
        let moscow = City(name: String.localizedStringWithFormat(moscowString), latitude: 56, longitude: 38)
        let instanbulString = NSLocalizedString("Istanbul", comment: "")
        let instanbul = City(name: String.localizedStringWithFormat(instanbulString), latitude: 43, longitude: 39)
        let londonString = NSLocalizedString("London", comment: "")
        let london = City(name: String.localizedStringWithFormat(londonString), latitude: 51, longitude: 0)
        let parisString = NSLocalizedString("Paris", comment: "")
        let paris = City(name: String.localizedStringWithFormat(parisString), latitude: 48, longitude: 2)
        return [moscow, instanbul, london, paris]
    }

}
