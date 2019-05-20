//
//  Data+extension.swift
//  APJExtensionsiOS
//
//  Created by Angelo Pino on 20/05/2019.
//  Copyright © 2019 Pino, Angelo. All rights reserved.
//

import UIKit

public extension Data {

    var toImage: UIImage? {
        return UIImage(data: self)
    }
}
