//
//  ViewController.swift
//  darkSky
//
//  Created by Илья Маркин on 19/03/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import PinLayout
import RxCocoa
import RxSwift
import UIKit

class ForecastViewController: UIViewController {

    // MARK: - Subviews
    lazy var tableView = UITableView().with {
        $0.delegate = self
        $0.dataSource = self
    }
    let locationLabel = UILabel().with {
        $0.textAlignment = .center
    }
    var iconImageView = UIImageView()
    let summaryLabel = UILabel().with {
        $0.textAlignment = .center
    }
    let temperatureLabel = UILabel().with {
        $0.textAlignment = .center
    }
    let separatorView = UIView().with {
        $0.backgroundColor = #colorLiteral(red: 0.8133929372, green: 0.8132717609, blue: 0.781655848, alpha: 1)
    }
    let separatorForCVView = UIView().with {
        $0.backgroundColor = #colorLiteral(red: 0.8133929372, green: 0.8132717609, blue: 0.781655848, alpha: 1)
    }
    let flowLayout = UICollectionViewFlowLayout().with {
        $0.scrollDirection = .horizontal
        $0.estimatedItemSize = CGSize(width: 60, height: 100)
    }
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout).with {
        $0.backgroundColor = .white
        $0.showsHorizontalScrollIndicator = false
    }

    // MARK: - Properties
    var tableViewCells = [DailyCellType]() {
        didSet {
            tableView.reloadData()
        }
    }
    var collectionViewCells = [HourlyCellType]() {
        didSet {
            collectionView.reloadData()
        }
    }
    let output: ForecastViewOutput
    private let disposeBag = DisposeBag()
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

        collectionView.dataSource = self
        collectionView.delegate = self

        self.tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.reuseId)
        self.collectionView.register(
            HourlyCollectionViewCell.self,
            forCellWithReuseIdentifier: HourlyCollectionViewCell.reuseId)

        addNavigationItem()
    }

//    private func bindObservables() {
//        refreshButton.rx.tap
//    }

    // MARK: - NavigationItem
//    @objc private func refreshButtonTapped(sender: UIButton) {
//        output.didRefresh()
//    }

    @objc private func changeCityButtonTapped(sender: UIButton) {
        let vc = ItemSelectionBuilder.build()
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        layout()
    }

}

extension ForecastViewController: ItemSelectionViewControllerDelegate {

    func didSelectCity(_ city: City) {
        output.didLoadWith(newCity: city)
    }

}

private extension ForecastViewController {

    // MARK: - Castomize subview
    private func castomizeSubviews() {

        let subviews = [tableView,
                        locationLabel,
                        summaryLabel,
                        iconImageView,
                        temperatureLabel,
                        collectionView,
                        separatorView,
                        separatorForCVView]

        view.addSubviews(subviews)
    }

    // MARK: - Add Navigation Item
    func addNavigationItem() {
        let refreshButton = UIBarButtonItem(
            barButtonSystemItem: .refresh,
            target: self,
            action: nil)

        let changeCityButton = UIBarButtonItem(
            barButtonSystemItem: .search,
            target: self,
            action: nil)

        refreshButton.rx.tap.subscribe(onNext: { [unowned self] _ in
            self.output.didRefresh()
        }).disposed(by: disposeBag)

        changeCityButton.rx.tap.subscribe(onNext: { [unowned self] _ in
            let vc = ItemSelectionBuilder.build()
            vc.delegate = self
            self.present(vc, animated: true, completion: nil)
        }).disposed(by: disposeBag)

        self.navigationItem.rightBarButtonItem = refreshButton
        self.navigationItem.leftBarButtonItem = changeCityButton
    }

    // MARK: - Layout
    private func layout() {
        let height: CGFloat = 40
        let cvHeight: CGFloat = 100
        let top: CGFloat = 90
        let iconSize: CGFloat = 140
        let left: CGFloat = 20
        let marginTop: CGFloat = 5

        locationLabel.pin
            .horizontally()
            .height(height)
            .top(top)

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
            .height(1)
            .below(of: summaryLabel)
            .left(left)
            .right()
            .marginTop(marginTop)

        collectionView.pin
            .horizontally()
            .height(cvHeight)
            .below(of: separatorView)

        separatorForCVView.pin
            .height(1)
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
        locationLabel.text = timeZone
        summaryLabel.text = model.summary
        temperatureLabel.text = "\(Int(model.temperature))˚C"
        let someIcon = UIImage(named: model.icon.rawValue)
        iconImageView.image = someIcon
    }

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
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Отменна", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Повторить", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
