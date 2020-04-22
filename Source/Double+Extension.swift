//
//  Double+Extension.swift
//  APJExtensionsiOSTests
//
//  Created by Angelo Pino on 23/04/2020.
//  Copyright © 2020 Pino, Angelo. All rights reserved.
//

import Foundation

public extension Double {
    var formatUsingAbbrevation: String {
        
        let numFormatter = NumberFormatter()
        
        typealias Abbrevation = (threshold: Double, divisor: Double, suffix: String)
        let abbreviations: [Abbrevation] = [(0, 1, ""),
                                            (1000.0, 1000.0, "K"),
                                            (100_000.0, 1_000_000.0, "M"),
                                            (100_000_000.0, 1_000_000_000.0, "B")]
        
        let absVal = abs(self)
        let abbreviation: Abbrevation = abbreviations.reduce(abbreviations[0]) { (result: Abbrevation, current: (threshold: Double, divisor: Double, suffix: String)) -> Abbrevation in
            if (absVal < current.threshold) {
                return result
            }
            return current
        }
        
        let value = NSNumber(value: self / abbreviation.divisor)
        numFormatter.positiveSuffix = abbreviation.suffix
        numFormatter.negativeSuffix = abbreviation.suffix
        numFormatter.allowsFloats = true
        numFormatter.minimumIntegerDigits = 1
        numFormatter.minimumFractionDigits = 0
        numFormatter.maximumFractionDigits = 1
        
        return numFormatter.string(from: value) ?? String(self)
    }
}
