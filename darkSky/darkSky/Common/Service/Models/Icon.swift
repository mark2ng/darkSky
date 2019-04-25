//
//  IconEnum.swift
//  darkSky
//
//  Created by Илья Маркин on 30/03/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import Foundation

enum Icon: String {
    case clearDay = "clear-day"
    case clearNight = "clear-night"
    case cloudy = "cloudy"
    case fog = "fog"
    case partlyCloudyDay = "partly-cloudy-day"
    case partlyCloudyNight = "partly-cloudy-night"
    case rain = "rain"
    case sleet = "sleet"
    case snow = "snow"
    case unpredictedIcon = "unpredicted-icon"
    case wind = "wind"

    init(title: String) {
        switch title {
        case "clear-day":
            self = .clearDay
        case "clear-night":
            self = .clearNight
        case "cloudy":
            self = .cloudy
        case "fog":
            self = .fog
        case "partly-cloudy-day":
            self = .partlyCloudyDay
        case "partly-cloudy-night":
            self = .partlyCloudyNight
        case "rain":
            self = .rain
        case "sleet":
            self = .sleet
        case "snow":
            self = .snow
        case "wind":
            self = .wind
        default:
            self = .unpredictedIcon
        }
    }
}
