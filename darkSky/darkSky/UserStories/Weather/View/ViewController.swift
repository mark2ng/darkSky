//
//  ViewController.swift
//  darkSky
//
//  Created by Илья Маркин on 19/03/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import PinLayout
import UIKit

class ForecastViewController: UIViewController {

    // MARK: - Subviews
    let key = "04722e138346054ee6f55cb96403a88b"
    let darkSky = DarkSkyService()
    let tableView = UITableView()

    let locationLabel = UILabel()
    let timeLabel = UILabel()
    var iconImageView = UIImageView()
    let summaryLabel = UILabel()
    let temperatureLabel = UILabel()
    let separatorView = UIView()
    let collectionView = UICollectionView()

    // MARK: - Properties
    var forecast: Forecast? {
        didSet {
            setupData()
        }
    }
    let output: ForecastViewOutput

    // MARK: - Init
    init(output: ForecastViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white

        output.didLoad()

        tableView.dataSource = self
        tableView.delegate = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.estimatedItemSize = CGSize(width: 40, height: 30) // !! hardcode size
        collectionView.collectionViewLayout = flowLayout
        collectionView.dataSource = self
        collectionView.delegate = self
        self.tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: "WeatherTableViewCell")
        self.collectionView.register(HourlyCollectionViewCell.self,
                                     forCellWithReuseIdentifier: HourlyCollectionViewCell.reuseId)
        let refreshButton = UIBarButtonItem(
            barButtonSystemItem: .refresh,
            target: self,
            action: #selector(refreshButtonTapped)
        )

        self.navigationItem.rightBarButtonItem = refreshButton

        timeLabel.textAlignment = .center
        locationLabel.textAlignment = .center
        summaryLabel.textAlignment = .center
        temperatureLabel.textAlignment = .center

        view.addSubview(tableView)
        view.addSubview(locationLabel)
        view.addSubview(timeLabel)
        view.addSubview(summaryLabel)
        view.addSubview(iconImageView)
        view.addSubview(temperatureLabel)
        view.addSubview(collectionView)

        separatorView.pin.height(1)
        separatorView.backgroundColor = #colorLiteral(red: 0.8133929372, green: 0.8132717609, blue: 0.781655848, alpha: 1)
        view.addSubview(separatorView)
    }

    @objc private func refreshButtonTapped(sender: UIButton) {
        output.didLoad()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        layout()
    }

    private func layout() {
        let height: CGFloat = 40

        timeLabel.pin
            .horizontally()
//            .left()
//            .right()
            .height(5%)
            .top(10%)

        locationLabel.pin
            .left()
            .right()
            .height(5%)
            .below(of: timeLabel)

        iconImageView.pin
//            .height(20%)
            .size(140)
//            .aspectRatio(1)
            .hCenter()
            .below(of: locationLabel)

        temperatureLabel.pin
            .left()
            .right()
            .height(5%)
            .below(of: iconImageView)

        summaryLabel.pin
            .left()
            .right()
            .height(5%)
            .below(of: temperatureLabel)

        separatorView.pin
            .below(of: summaryLabel)
            .left(20)
            .right()
            .marginTop(5)

        tableView.pin
            .below(of: separatorView)
            .bottom()
            .left()
            .right()

    }

    private func setupData() {
        if let forecast = forecast {
//            let formatter = DateFormatter()
//            formatter.dateFormat = "EE HH:mm:ss"
//            let date = Date(timeIntervalSince1970: forecast.currently.time)
//            let currentDay = formatter.string(from: date)
            timeLabel.text = "\(forecast.currently.currentTime)"
            locationLabel.text = forecast.timezone
            summaryLabel.text = forecast.currently.summary
            temperatureLabel.text = "\(Int(forecast.currently.temperature))˚C"
            let someIcon = UIImage(named: forecast.currently.icon.rawValue)
            iconImageView.image = someIcon
        }
    }

}

extension ForecastViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecast?.daily.data.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "WeatherTableViewCell",
            for: indexPath
            ) as? WeatherTableViewCell
            else { return UITableViewCell() }
        if let forecast = forecast?.daily.data[indexPath.row] {
            cell.setup(weather: forecast)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = forecast?.hourly.data[indexPath.row]
        let vc = DetailForecastViewController()
        vc.weather = model
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

extension ForecastViewController: ForecastViewInput {

    func setupTableView(_ forecast: Forecast) {
        self.forecast = forecast
        self.tableView.reloadData()
    }

}

extension ForecastViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}
