//
//  Array+extension.swift
//  APJExtensions
//
//  Created by Pino, Angelo on 07/08/2017.
//  Copyright © 2017 Pino, Angelo. All rights reserved.
//

import UIKit

public extension Array {
    var isNotEmpty: Bool {
        return !isEmpty
    }
    
    var random: Element {
        return self[Int(arc4random_uniform(UInt32(count)))]
    }

    mutating func appendNvl(_ newElement: Element?) {
        guard let el = newElement else { return }
        append(el)
    }
    
    mutating func appendNvl(contentsOf: [Element]?) {
        guard let el = contentsOf else { return }
        append(contentsOf: el)
    }
    
    mutating func append(fill by: Element, for length: Int, prepend: Bool = false) {
        guard length > 0 else { return }
        for _ in 0..<length {
            prepend ? insert(by, at: 0) : append(by)
        }
    }
    
    mutating func fill(_ by: Element, length: Int, prepend: Bool = false) {
        let fillLength = length - count
        if fillLength > 0 {
            for _ in 0..<fillLength {
                prepend ? insert(by, at: 0) : append(by)
            }
        }
    }
    
    mutating func appendIf(_ element: Element?, condition: Bool) {
        guard condition else { return }
        appendNvl(element)
    }
    
    func last(where predicate: (Element) throws -> Bool) rethrows -> Element? {
        guard count > 0 else { return nil }
        for el in reversed() {
            if try predicate(el) {
                return el
            }
        }
        return nil
    }
    
    func values(by index: [Int]) -> [Element] {
        var result = [Element]()
        index.forEach {
            guard $0 < self.count && $0 > -1 else { return }
            result.append(self[$0])
        }
        return result
    }

}

public extension Array where Element : Equatable {
    @discardableResult
    mutating func appendIfNotContain(_ newElement: Element?) -> Bool {
        guard let el = newElement, firstIndex(of: el) == nil else { return false }
        append(el)
        return true
    }
    
    mutating func toogle(_ newElement: Element?) {
        guard let el = newElement else { return }
        guard let index = firstIndex(of: el) else {
            append(el)
            return
        }
        remove(at: index)
    }
    
    mutating func toogle(_ newElements: [Element]?) {
        guard let elements = newElements else { return }
        
        for element in elements {
            toogle(element)
        }
    }
    
    mutating func remove(_ element: Element?) {
        guard let el = element, let index = firstIndex(of: el) else { return }
        remove(at: index)
    }
    
    mutating func remove(_ elements: [Element]?) {
        guard let elements = elements else { return }
        for element in elements {
            remove(element)
        }
    }
    
    mutating func remove(where predicate: (Element) throws -> Bool) rethrows {
        guard count > 0 else { return }
        for element in self {
            if try predicate(element) {
                remove(element)
            }
        }
    }
    
    func containsNvl(_ element: Element?) -> Bool {
        guard let element = element else { return false }
        return self.contains(element)
    }
}

