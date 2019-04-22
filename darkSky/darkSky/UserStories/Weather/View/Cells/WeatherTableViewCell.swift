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
    let temperatureMinLabel = UILabel()
    let temperatureMaxLabel = UILabel()
    let currentDayLabel = UILabel()

    static let reuseId = "WeatherTableViewCell"

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: WeatherTableViewCell.reuseId)

        addSubviews([temperatureMinLabel, temperatureMaxLabel, currentDayLabel])
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

        currentDayLabel.pin
            .sizeToFit()
            .left(margin)
            .vCenter()

        temperatureMinLabel.pin
            .sizeToFit()
            .center()

        temperatureMaxLabel.pin
            .sizeToFit()
            .right(margin)
            .vCenter()

    }

    // MARK: - Public Methods
    func setup(weather: WeatherDaily) {

        currentDayLabel.text = weather.currentDay
        temperatureMinLabel.text = "Min: \(Int(weather.temperatureMin))˚C"
        temperatureMaxLabel.text = "Max: \(Int(weather.temperatureMax))˚C"
    }

}
