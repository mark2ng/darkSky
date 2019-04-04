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

    func getTemperature(_ success: @escaping (Forecast) -> Void) {

        AF.request("https://api.darksky.net/forecast/04722e138346054ee6f55cb96403a88b/56,38?lang=ru&units=si")
            .responseJSON { (response) in

                if let data = response.data {

                    guard let forecast = try? JSONDecoder().decode(Forecast.self, from: data) else { return }

                    success(forecast)
                }
            }
    }

}
