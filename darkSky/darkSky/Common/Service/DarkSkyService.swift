//
//  DarkSkyService.swift
//  darkSky
//
//  Created by Илья Маркин on 19/03/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import Alamofire
import Foundation

class DarkSkyService {

    private let parameters = ["lang": "ru", "units": "si"]
    private let key = "04722e138346054ee6f55cb96403a88b"

    func getTemperature(city: City, date: Int? = nil,
                        _ success: @escaping (Forecast) -> Void, onError: @escaping () -> Void) {
        var requestString = "https://api.darksky.net/forecast/\(key)/\(city.latitude),\(city.longitude)"
        if let date = date {
            requestString += ",\(Int(date))"
        }
        AF.request(
            requestString,
            parameters: parameters)
            .responseData { (response) in
                switch response.result {
                case .success(let value):
                    guard let forecast = try? JSONDecoder().decode(Forecast.self, from: value) else { return }
                    success(forecast)
                case .failure(let error):
                    print(error)
                    onError()
                }
            }
    }
}
