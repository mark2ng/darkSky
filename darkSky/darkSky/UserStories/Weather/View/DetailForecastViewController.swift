//
//  DetailForecastViewController.swift
//  darkSky
//
//  Created by Илья Маркин on 20/03/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import PinLayout
import UIKit

class DetailForecastViewController: UIViewController {

    // MARK: - Properties
    var weather: WeatherHourly?
    let weatherLabel = UILabel()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(weatherLabel)

        if let weather = weather?.summary {
            switch weather {
            case .clear:
                view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            case .cloudy, .partlyCloudy, .overcast, .partlyWindyCloudy, .windyAndCloudy, .partlyWindyAndOvercast:
                view.backgroundColor = #colorLiteral(red: 0.8133929372, green: 0.8132717609, blue: 0.781655848, alpha: 1)
            case .snow, .possibleLightSnow:
                view.backgroundColor = .white
            default:
                view.backgroundColor = .white
            }
        }

        if let weather = weather {
            let formatter = DateFormatter()
            formatter.dateFormat = "EE HH:mm"
            let date = Date(timeIntervalSince1970: weather.time)
            let currentDay = formatter.string(from: date)

            weatherLabel.text = "\(currentDay) \(Int(weather.temperature))˚C \(weather.summary.rawValue)"
        }

    }
    // MARK: - Layout
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        weatherLabel.pin
            .sizeToFit()
            .vCenter()
            .hCenter()
    }

}
