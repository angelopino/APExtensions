//
//  Array+extension.swift
//  APJExtensions
//
//  Created by Pino, Angelo on 07/08/2017.
//  Copyright © 2017 Pino, Angelo. All rights reserved.
//

import UIKit

public extension Array {

    public mutating func appendNvl(_ newElement: Element?) {
        guard let el = newElement else { return }
        append(el)
    }
    
    public mutating func appendNvl(contentsOf: [Element]?) {
        guard let el = contentsOf else { return }
        append(contentsOf: el)
    }
    
    public mutating func append(fill by: Element, for length: Int, prepend: Bool = false) {
        guard length > 0 else { return }
        for _ in 0..<length {
            prepend ? insert(by, at: 0) : append(by)
        }
    }
    
    public func last(where predicate: (Element) throws -> Bool) rethrows -> Element? {
        guard count > 0 else { return nil }
        for el in reversed() {
            if try predicate(el) {
                return el
            }
        }
        return nil
    }

}

public extension Array where Element : Equatable {
    @discardableResult
    public mutating func appendIfNotContain(_ newElement: Element?) -> Bool {
        guard let el = newElement, index(of: el) == nil else { return false }
        append(el)
        return true
    }
    
    public mutating func toogle(_ newElement: Element?) {
        guard let el = newElement else { return }
        guard let index = index(of: el) else {
            append(el)
            return
        }
        remove(at: index)
    }
    
    public mutating func toogle(_ newElements: [Element]?) {
        guard let elements = newElements else { return }
        
        for element in elements {
            toogle(element)
        }
    }
    
    public mutating func removeNvl(_ element: Element?) {
        guard let el = element, let index = index(of: el) else { return }
        remove(at: index)
    }
    
    public func containsNvl(_ element: Element?) -> Bool {
        guard let element = element else { return false }
        return self.contains(element)
    }
}
