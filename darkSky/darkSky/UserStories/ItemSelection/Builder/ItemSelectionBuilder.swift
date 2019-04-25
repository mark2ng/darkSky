//
//  CityModelBuilder.swift
//  darkSky
//
//  Created by Илья Маркин on 11/04/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import Foundation

class ItemSelectionBuilder {

    static func build() -> ItemSelectionViewController {
        let interactor = ItemSelectionInteractor()

        let presenter = ItemSelectionPresenter(with: interactor)
        interactor.output = presenter
        let vc = ItemSelectionViewController(output: presenter)

        presenter.view = vc
        return vc
    }

}
