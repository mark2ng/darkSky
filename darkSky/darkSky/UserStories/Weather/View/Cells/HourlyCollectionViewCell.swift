//
//  HourlyCollectionViewCell.swift
//  darkSky
//
//  Created by Илья Маркин on 27/03/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import PinLayout
import UIKit

class HourlyCollectionViewCell: UICollectionViewCell {

    let temperatureLabel = UILabel()
    let weatherLabel = UILabel()

    static let reuseId = "HourlyCollectionViewCell"

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(temperatureLabel)
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
        temperatureLabel.pin
            .sizeToFit()
            .hCenter()

        weatherLabel.pin
            .sizeToFit()
    }

    // MARK: - Public Methods
    func setup(weather: WeatherHourly) {
    }

}
