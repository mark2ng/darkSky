//
//  DetailForecastTableViewCell.swift
//  darkSky
//
//  Created by Илья Маркин on 24/04/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import UIKit

class DetailForecastTableViewCell: UITableViewCell {

    let dateLabel = UILabel()
    let weatherImageView = UIImageView()
    let temperatureLabel = UILabel()

    static let reuseId = "DetailForecastTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: DetailForecastTableViewCell.reuseId)

        addSubviews([dateLabel, weatherImageView, temperatureLabel])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        layout()
    }

    private func layout() {
        let size: CGFloat = 40
        let margin: CGFloat = 15

        dateLabel.pin
            .sizeToFit()
            .left(margin)
            .vCenter()
        weatherImageView.pin
            .size(size)
            .center()
        temperatureLabel.pin
            .sizeToFit()
            .vCenter()
            .right(margin)

    }

    func setupData(weather: WeatherHourly) {
        dateLabel.text = weather.currentTime
        let icon = UIImage(named: weather.icon.rawValue)
        weatherImageView.image = icon
        temperatureLabel.text = weather.temperatureAsString
    }

}
