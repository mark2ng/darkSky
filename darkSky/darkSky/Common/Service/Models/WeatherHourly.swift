//
//  Data.swift
//  darkSky
//
//  Created by Илья Маркин on 19/03/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import Foundation

enum Summary: String {
    case clear = "Ясно"
    case cloudy = "Облачно"
    case overcast = "Сильная Облачность"
    case partlyCloudy = "Небольшая Облачность"
    case possibleLightSnow = "Возможен Небольшой Снег"
    case snow = "Снег"
    case partlyWindyCloudy = "Слабый Ветер и Облачно"
    case windyAndCloudy = "Ветер и Облачно"
    case partlyWindyAndOvercast = "Слабый Ветер и Сильная Облачность"
    case unknown = "Неизвестно"

    init(title: String) {
        switch title {
        case "Ясно":
            self = .clear
        case "Облачно":
            self = .cloudy
        case "Сильная Облачность":
            self = .overcast
        case "Небольшая Облачность":
            self = .partlyCloudy
        case "Возможен Небольшой Снег":
            self = .possibleLightSnow
        case "Снег":
            self = .snow
        case "Слабый Ветер и Облачно":
            self = .partlyWindyCloudy
        case "Ветер и Облачно":
            self = .windyAndCloudy
        case "Слабый Ветер и Сильная Облачность":
            self = .partlyWindyAndOvercast
        default:
            self = .unknown
        }
    }
}

struct WeatherHourly: Decodable {
    let time: Double
    let summary: Summary
    let icon: Icon
//    let precipIntensity: Double
//    let precipProbability: Double
//    let precipType: String
    let temperature: Double
//    let apparentTemperature: Double
//    let dewPoint: Double
//    let humidity: Double
//    let pressure: Double
//    let windSpeed: Double
//    let windGust: Double
//    let windBearing: Double
//    let cloudCover: Double
//    let uvIndex: Double
//    let visibility: Double
//    let ozone: Double

    enum CodingKeys: String, CodingKey {
        case time
        case summary
        case icon
        case temperature
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.time = try container.decode(Double.self, forKey: .time)
        self.temperature = try container.decode(Double.self, forKey: .temperature)
        let weatherType: String = try container.decode(String.self, forKey: .summary)
        self.summary = Summary(title: weatherType)
        let icon: String = try container.decode(String.self, forKey: .icon)
        self.icon = Icon(title: icon)

    }
}

extension WeatherHourly {

    var currentTime: String {

        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let date = Date(timeIntervalSince1970: time)
        return formatter.string(from: date)
    }

    var temperatureAsString: String {
        return "\(Int(temperature))˚C"
    }

}
