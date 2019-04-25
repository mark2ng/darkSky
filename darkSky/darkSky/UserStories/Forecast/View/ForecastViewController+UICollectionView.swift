//
//  File.swift
//  darkSky
//
//  Created by Илья Маркин on 22/04/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import UIKit

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ForecastViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewCells.count
    }

    func collectionView(_ collectionView: UICollectionView,
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
