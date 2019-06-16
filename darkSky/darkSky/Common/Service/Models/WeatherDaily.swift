//
//  WeatherDaily.swift
//  darkSky
//
//  Created by Илья Маркин on 28/03/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import Foundation

struct WeatherDaily: Decodable {

    let time: Double
    let summary: String
    let temperatureMin: Double
    let temperatureMax: Double

}

extension WeatherDaily {

    var currentDay: String {

        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM"
        //        "EE HH:mm"
        let date = Date(timeIntervalSince1970: time)
        return formatter.string(from: date)
    }

    var timeAsInt: Int {
        return Int(time)
    }

    var temperatureMinAsString: String {
        let formatString = NSLocalizedString("Min: ", comment: "Minimum temperature")
        let degreeString = NSLocalizedString("degree", comment: "")
        return formatString + String.localizedStringWithFormat(degreeString, Int(temperatureMin))
//        return "От: \(Int(temperatureMax))˚C"
    }

    var temperatureMaxAsString: String {
        let formatString = NSLocalizedString("Max: ", comment: "Maximum temperature")
        let degreeString = NSLocalizedString("degree", comment: "")
        return formatString + String.localizedStringWithFormat(degreeString, Int(temperatureMax))
//        return "До: \(Int(temperatureMax))˚C"
    }

}
