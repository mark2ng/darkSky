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

    let timeLabel = UILabel()
    let temperatureLabel = UILabel()
    var iconImageView = UIImageView()

    static let reuseId = "HourlyCollectionViewCell"

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubviews([temperatureLabel, timeLabel, iconImageView])
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
        let size: CGFloat = 50
        let margin: CGFloat = 10

        timeLabel.pin
            .sizeToFit()
            .hCenter()

        iconImageView.pin
            .size(size)
            .hCenter()
            .below(of: timeLabel)

        temperatureLabel.pin
            .sizeToFit()
            .hCenter()
            .below(of: iconImageView)
            .marginTop(margin)
    }

    // MARK: - Public Methods
    func setup(weather: WeatherHourly) {
        timeLabel.text = weather.currentTime
        temperatureLabel.text = "\(Int(weather.temperature))˚C"
        let someIcon = UIImage(named: weather.icon.rawValue)
        iconImageView.image = someIcon

        setNeedsLayout()
    }

}
