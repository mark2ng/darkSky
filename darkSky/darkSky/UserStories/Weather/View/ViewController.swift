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
    let tableView = UITableView()
    let locationLabel = UILabel()
    let timeLabel = UILabel()
    var iconImageView = UIImageView()
    let summaryLabel = UILabel()
    let temperatureLabel = UILabel()
    let separatorView = UIView()
    let separatorForCVView = UIView()
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.estimatedItemSize = CGSize(width: 60, height: 100)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = .white
        cv.showsHorizontalScrollIndicator = false

        return cv
    }()
    let refreshButton = UIBarButtonItem(
        barButtonSystemItem: .refresh,
        target: self,
        action: #selector(refreshButtonTapped))

    let changeCityButton = UIBarButtonItem(
        barButtonSystemItem: .search,
        target: self,
        action: #selector(changeCityButtonTapped))

    // MARK: - Properties
    private var tableViewCells = [DailyCellType]() {
        didSet {
            tableView.reloadData()
        }
    }
    private var collectionViewCells = [HourlyCellType]() {
        didSet {
            collectionView.reloadData()
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
        castomizeSubviews()

        tableView.dataSource = self
        tableView.delegate = self

        collectionView.dataSource = self
        collectionView.delegate = self

        self.tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.reuseId)
        self.collectionView.register(
            HourlyCollectionViewCell.self,
            forCellWithReuseIdentifier: HourlyCollectionViewCell.reuseId)
    }

// MARK: - NavigationItem
    @objc private func refreshButtonTapped(sender: UIButton) {
        output.didRefresh()
    }

    @objc private func changeCityButtonTapped(sender: UIButton) {
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        layout()
    }

}

extension ForecastViewController {

    // MARK: - Castomize subview
    private func castomizeSubviews() {

        self.navigationItem.rightBarButtonItem = refreshButton
        self.navigationItem.leftBarButtonItem = changeCityButton

        timeLabel.textAlignment = .center
        locationLabel.textAlignment = .center
        summaryLabel.textAlignment = .center
        temperatureLabel.textAlignment = .center

        separatorView.pin.height(1)
        separatorView.backgroundColor = #colorLiteral(red: 0.8133929372, green: 0.8132717609, blue: 0.781655848, alpha: 1)
        separatorForCVView.pin.height(1)
        separatorForCVView.backgroundColor = #colorLiteral(red: 0.8133929372, green: 0.8132717609, blue: 0.781655848, alpha: 1)

        let subviews = [tableView, locationLabel, timeLabel, summaryLabel, iconImageView, temperatureLabel,
                        collectionView, separatorView, separatorForCVView]

        view.addSubviews(subviews)
    }

    // MARK: - Layout
    private func layout() {
        let height: CGFloat = 40
        let cvHeight: CGFloat = 100
        let top: CGFloat = 90
        let iconSize: CGFloat = 140
        let left: CGFloat = 20
        let marginTop: CGFloat = 5

        timeLabel.pin
            .horizontally()
            .height(height)
            .top(top)

        locationLabel.pin
            .horizontally()
            .height(height)
            .below(of: timeLabel)

        iconImageView.pin
            .size(iconSize)
            .hCenter()
            .below(of: locationLabel)

        temperatureLabel.pin
            .horizontally()
            .height(height)
            .below(of: iconImageView)

        summaryLabel.pin
            .horizontally()
            .height(height)
            .below(of: temperatureLabel)

        separatorView.pin
            .below(of: summaryLabel)
            .left(left)
            .right()
            .marginTop(marginTop)

        collectionView.pin
            .horizontally()
            .height(cvHeight)
            .below(of: separatorView)

        separatorForCVView.pin
            .below(of: collectionView)
            .left(left)
            .right()
            .marginTop(marginTop)

        tableView.pin
            .below(of: separatorForCVView)
            .bottom()
            .left()
            .right()

    }

    // MARK: - Setup data
    private func setupData(with model: Currently, timeZone: String) {
        timeLabel.text = "\(model.currentTime)"
        locationLabel.text = timeZone
        summaryLabel.text = model.summary
        temperatureLabel.text = "\(Int(model.temperature))˚C"
        let someIcon = UIImage(named: model.icon.rawValue)
        iconImageView.image = someIcon
    }

}

    // MARK: - UITableViewDataSource, UITableViewDelegate
extension ForecastViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewCells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: WeatherTableViewCell.reuseId,
            for: indexPath) as? WeatherTableViewCell
            else { return UITableViewCell() }

        let model = tableViewCells[indexPath.row]
        switch model {
        case .regular(let weatherDaily):
            cell.setup(weather: weatherDaily)
        }

        return cell
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let model = forecast?.hourly.data[indexPath.row]
//        let vc = DetailForecastViewController()
//        vc.weather = model
//        self.navigationController?.pushViewController(vc, animated: true)
//    }

    //let vc = CityModalViewController()
    // vc.delegate = self
    //extension ForecastViewController: CityViewControllerDelegate {
    //    func didSelectCity(_ city: City) {
    //    output.getWeather(for: city)

//}

}

extension ForecastViewController: ForecastViewInput {

    func setupTableView(with tvmodels: [DailyCellType],
                        cvmodels: [HourlyCellType], currently: Currently, timeZone: String) {
        tableViewCells = tvmodels
        collectionViewCells = cvmodels
        setupData(with: currently, timeZone: timeZone)
    }

    func showError() {
        let alert = UIAlertController(
            title: "Ошибка",
            message: "Нет подключения к Интернету",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отменна", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Повторить", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ForecastViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewCells.count
    }

    func collectionView(_
        collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HourlyCollectionViewCell.reuseId,
            for: indexPath
            ) as? HourlyCollectionViewCell
            else { return UICollectionViewCell() }

        let model = collectionViewCells[indexPath.row]
        switch model {
        case .regular(let weatherHourly):
            cell.setup(weather: weatherHourly)
        }

        return cell
    }

}

extension UIView {

    func addSubviews(_ views: [UIView]) {
        views.forEach {
            addSubview($0)
        }
    }

}
