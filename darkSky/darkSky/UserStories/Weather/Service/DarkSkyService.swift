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
    private let latitude = 56
    private let longitude = 38

    func getTemperature(_ success: @escaping (Forecast) -> Void) {

        AF.request(
            "https://api.darksky.net/forecast/\(key)/\(latitude),\(longitude)",
            parameters: parameters
            )
            .responseJSON { (response) in

                if let data = response.data {

                    guard let forecast = try? JSONDecoder().decode(Forecast.self, from: data) else { return }

                    success(forecast)
                }
            }
    }

}
