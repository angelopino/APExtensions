//
//  String+extension.swift
//  APJExtensionsiOS
//
//  Created by Pino, Angelo on 13/01/2018.
//  Copyright © 2018 Pino, Angelo. All rights reserved.
//

import UIKit

public extension String {

    func count(regex: String) -> Int {
        guard let regex = try? NSRegularExpression(pattern: regex, options: []) else { return 0 }
        let matches = regex.matches(in: self, options: [], range: NSRange(location: 0, length: count))
        return matches.count
    }
    
    func test(regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    var isNotEmpty: Bool {
        return !isEmpty
    }
    
    var toImage: UIImage? {
        return UIImage(named: self)
    }
    
    var storyboard: UIStoryboard {
        return UIStoryboard(name: self, bundle: nil)
    }
    
    var toInt: Int? {
        return Int(self)
    }
    
    func toDate(_ format: String) -> Date? {
        guard !isEmpty else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en_US")
        return dateFormatter.date(from: self)
    }

}
