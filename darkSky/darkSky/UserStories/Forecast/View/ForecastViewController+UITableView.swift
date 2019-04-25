//
//  File.swift
//  darkSky
//
//  Created by Илья Маркин on 22/04/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import UIKit

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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = tableViewCells[indexPath.row]
        switch model {
        case .regular(let weatherDaily):
            output.didCellTapped(weatherDaily: weatherDaily)
        }
    }

}
