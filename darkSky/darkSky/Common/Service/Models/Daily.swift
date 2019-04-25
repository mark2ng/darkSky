//
//  Daily.swift
//  darkSky
//
//  Created by Илья Маркин on 28/03/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import Foundation

struct Daily: Decodable {
    let data: [WeatherDaily]
}
