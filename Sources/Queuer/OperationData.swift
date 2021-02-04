//
//  OperationData.swift
//  Queuer
//
//  Created by Nicolas Prugne on 04/02/2021.
//  Copyright © 2021 Fabrizio Brancati. All rights reserved.
//

import Foundation

class OperationData {
    private let values: [String: Any]
    
    private init(_ values: [String: Any]) {
        self.values = values
    }
    
    func getBoolean(_ key: String, _ defaultValue: Bool) -> Bool {
        return getValue(key, defaultValue)
    }
    
    func getInt(_ key: String, _ defaultValue: Int) -> Int {
        return getValue(key, defaultValue)
    }
    
    func getString(_ key: String) -> String? {
        return getOptionalValue(key)
    }
    
    private func getOptionalValue <T> (_ key: String) -> T? {
        var output: T? = nil
        
        if let value = values[key] as? T {
            output = value
        }
        
        return output
    }
    
    private func getValue <T> (_ key: String, _ defaultValue: T) -> T {
        var output = defaultValue
        
        if let value = values[key] as? T {
            output = value
        }
        
        return output
    }
    
    public final class Builder {
        private var values = [String: Any]()
        
        func putBoolean(_ key: String, _ value: Bool) -> Builder {
            values[key] = value
            return self
        }
        
        func putInt(_ key: String, _ value: Int) -> Builder {
            values[key] = value
            return self
        }
        
        func putString(_ key: String, _ value: String) -> Builder {
            values[key] = value
            return self
        }
        
        func build() -> OperationData {
            let operationData = OperationData(values)
            return operationData
        }
    }
}
