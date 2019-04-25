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
        let moscow = City(name: "Москва", latitude: 56, longitude: 38)
        let instanbul = City(name: "Стамбул", latitude: 43, longitude: 39)
        let london = City(name: "Лондон", latitude: 51, longitude: 0)
        let paris = City(name: "Париж", latitude: 48, longitude: 2)
        return [moscow, instanbul, london, paris]
    }

}
