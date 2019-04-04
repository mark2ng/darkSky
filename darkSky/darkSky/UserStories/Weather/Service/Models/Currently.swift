//
//  Currently.swift
//  darkSky
//
//  Created by Илья Маркин on 28/03/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import Foundation

struct Currently: Decodable {
    let time: Double
    let summary: String
    let icon: Icon
    let temperature: Double

    enum CodingKeys: String, CodingKey {
        case time
        case summary
        case icon
        case temperature
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.time = try container.decode(Double.self, forKey: .time)
        self.summary = try container.decode(String.self, forKey: .summary)

        let icon: String = try container.decode(String.self, forKey: .icon)
        self.icon = Icon(title: icon)

        self.temperature = try container.decode(Double.self, forKey: .temperature)
        print("!! time = ", currentTime)
    }
}

extension Currently {

    var currentTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EE HH:mm:ss"
        let date = Date(timeIntervalSince1970: time)
        return formatter.string(from: date)
    }

}
