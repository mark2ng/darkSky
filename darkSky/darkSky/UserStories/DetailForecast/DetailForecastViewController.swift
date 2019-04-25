//
//  DetailForecastViewController.swift
//  darkSky
//
//  Created by Илья Маркин on 20/03/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import ESPullToRefresh
import PinLayout
import UIKit

class DetailForecastViewController: UIViewController {

    // MARK: - Subviews
    lazy var tableView = UITableView().with {
        $0.delegate = self
        $0.dataSource = self
    }

    // MARK: - Properties
    let output: DetailForecastViewOutput
    var tableViewCells = [HourlyCellType]() {
        didSet {
            tableView.reloadData()
        }
    }

    init(output: DetailForecastViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        tableView.register(
            DetailForecastTableViewCell.self,
            forCellReuseIdentifier: DetailForecastTableViewCell.reuseId)

        view.addSubview(tableView)

        tableView.es.addPullToRefresh { [unowned self] in
            self.output.didLoad()

            self.tableView.es.stopPullToRefresh()
            self.tableView.es.stopPullToRefresh(ignoreFooter: false)
        }

        output.didLoad()
    }

    // MARK: - Layout
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        layout()
    }

    private func layout() {
        tableView.pin
            .top(view.pin.safeArea.top)
            .left()
            .right()
            .bottom()
    }

}

extension DetailForecastViewController: DetailForecastViewInput {
    func setupData(with model: [HourlyCellType]) {
        tableViewCells = model
    }
}

extension DetailForecastViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewCells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: DetailForecastTableViewCell.reuseId,
            for: indexPath) as? DetailForecastTableViewCell
            else { return UITableViewCell() }

        let model = tableViewCells[indexPath.row]
        switch model {
        case .regular(let weatherDaily):
            cell.setupData(weather: weatherDaily)
        }

        return cell
    }
}
