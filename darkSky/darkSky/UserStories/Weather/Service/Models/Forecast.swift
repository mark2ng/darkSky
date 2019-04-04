//
//  Forecast.swift
//  darkSky
//
//  Created by Илья Маркин on 19/03/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import Foundation

struct Forecast: Decodable {

//    let latitude: Double
//    let longitude: Double
    let timezone: String
    let currently: Currently
    let hourly: Hourly
    let daily: Daily

}
