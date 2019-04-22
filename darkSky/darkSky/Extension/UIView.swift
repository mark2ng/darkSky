//
//  File.swift
//  darkSky
//
//  Created by Илья Маркин on 11/04/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import UIKit

extension UIView {

    func addSubviews(_ views: [UIView]) {
        views.forEach {
            addSubview($0)
        }
    }

}
