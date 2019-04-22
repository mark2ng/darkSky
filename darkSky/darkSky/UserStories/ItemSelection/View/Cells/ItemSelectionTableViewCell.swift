//
//  CitiesTableViewCell.swift
//  darkSky
//
//  Created by Илья Маркин on 11/04/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import UIKit

class ItemSelectionTableViewCell: UITableViewCell {

    // MARK: - Properties
    let nameLabel = UILabel().with {
        $0.textAlignment = .center
    }
    static let reuseId = "CitiesTableViewCell"

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: ItemSelectionTableViewCell.reuseId)

        addSubview(nameLabel)
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
        nameLabel.pin
            .all()
    }

    func setup(_ city: City) {
        nameLabel.text = city.name
    }

}
