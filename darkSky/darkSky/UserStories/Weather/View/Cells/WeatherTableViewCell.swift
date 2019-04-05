//
//  WeatherTableViewCell.swift
//  darkSky
//
//  Created by Илья Маркин on 20/03/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import PinLayout
import UIKit

class WeatherTableViewCell: UITableViewCell {

    // MARK: - Properties
    let weatherLabel = UILabel()
    static let reuseId = "WeatherTableViewCell"

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: WeatherTableViewCell.reuseId)

        weatherLabel.textAlignment = .center
        addSubview(weatherLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()

        layout()
    }

    private func layout() {
        let margin: CGFloat = 15

        weatherLabel.pin
            .sizeToFit()
            .left(margin)
            .right()
            .vCenter()
    }

    // MARK: - Public Methods
    func setup(weather: WeatherDaily) {

        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM"
//        "EE HH:mm"
        let date = Date(timeIntervalSince1970: weather.time)
        let currentDay = formatter.string(from: date)

        weatherLabel.text = "\(currentDay) Min: \(Int(weather.temperatureMin))˚C  Max: \(Int(weather.temperatureMax))˚C"
    }

}
