//
//  CellType.swift
//  darkSky
//
//  Created by Илья Маркин on 11/04/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import Foundation

enum DailyCellType {
    case regular(_ forecast: WeatherDaily)
}

enum HourlyCellType {
    case regular(_ forecast: WeatherHourly)
}

enum CityCellType {
    case regular(_ city: City)
}
