//
//  String+extension.swift
//  APJExtensionsiOS
//
//  Created by Pino, Angelo on 13/01/2018.
//  Copyright © 2018 Pino, Angelo. All rights reserved.
//

import UIKit

public extension String {

    public func count(with regex: String) -> Int {
        guard let regex = try? NSRegularExpression(pattern: regex, options: []) else { return 0 }
        let matches = regex.matches(in: self, options: [], range: NSRange(location: 0, length: count))
        return matches.count
    }
    
    public func test(regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    public var isNotEmpty: Bool {
        return !isEmpty
    }
}
