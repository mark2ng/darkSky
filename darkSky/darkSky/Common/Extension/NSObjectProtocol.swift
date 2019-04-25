//
//  NSObjectProtocol.swift
//  darkSky
//
//  Created by Илья Маркин on 22/04/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import Foundation

extension NSObjectProtocol {

    func with(_ closure: (Self) -> Void) -> Self {
        closure(self)
        return self
    }

}
