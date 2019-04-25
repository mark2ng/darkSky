//
//  City.swift
//  darkSky
//
//  Created by Илья Маркин on 06/04/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import Foundation

class City {

    let name: String
    let latitude: Int
    let longitude: Int

    init(name: String, latitude: Int, longitude: Int) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
}
