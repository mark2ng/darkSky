//
//  Hourly.swift
//  darkSky
//
//  Created by Илья Маркин on 19/03/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import Foundation

struct Hourly: Decodable {
    let data: [WeatherHourly]
}
