//
//  UserDefault.swift
//  APJExtensionsiOS
//
//  Created by Angelo Pino on 22/05/2020.
//  Copyright © 2020 Pino, Angelo. All rights reserved.
//

import Foundation

@propertyWrapper
public struct UserDefault<T> {
    private let key: String
    private let defaultValue: T
    private let userDefaults: UserDefaults

    public init(_ key: String, defaultValue: T, userDefaults: UserDefaults = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.userDefaults = userDefaults
    }

    public var wrappedValue: T {
        get {
            guard let value = userDefaults.object(forKey: key) else {
                return defaultValue
            }

            return value as? T ?? defaultValue
        }
        set {
            if let value = newValue as? OptionalProtocol, value.isNil() {
                userDefaults.removeObject(forKey: key)
            } else {
                userDefaults.set(newValue, forKey: key)
            }
        }
    }
}

fileprivate protocol OptionalProtocol {
    func isNil() -> Bool
}

extension Optional : OptionalProtocol {
    func isNil() -> Bool {
        return self == nil
    }
}
