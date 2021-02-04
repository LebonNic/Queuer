//
//  OperationDataTest.swift
//  QueuerTests iOS
//
//  Created by Nicolas Prugne on 04/02/2021.
//  Copyright © 2021 Fabrizio Brancati. All rights reserved.
//

@testable import Queuer
import XCTest

class OperationDataTest: XCTestCase {
    
    internal func testOperationDataBuilder() {
        let KEY_INTEGER = "KEY_INTEGER"
        let KEY_BOOL = "KEY_BOOL"
        let KEY_STRING = "KEY_STRING"
        
        let operationData = OperationData.Builder()
            .putBoolean(KEY_BOOL, true)
            .putInt(KEY_INTEGER, 63)
            .putString(KEY_STRING, "FooString")
            .build()
        
        XCTAssertTrue(operationData.getBoolean(KEY_BOOL, false))
        XCTAssertEqual(operationData.getInt(KEY_INTEGER, -1), 63)
        XCTAssertEqual(operationData.getString(KEY_STRING), "FooString")
    }
    
    internal func testOperationDataDefaultValues() {
        let KEY_INTEGER = "KEY_INTEGER"
        let KEY_BOOL = "KEY_BOOL"
        let KEY_STRING = "KEY_STRING"
        
        let operationData = OperationData.Builder().build()
        XCTAssertTrue(operationData.getBoolean(KEY_BOOL, true))
        XCTAssertEqual(operationData.getInt(KEY_INTEGER, -1), -1)
        XCTAssertNil(operationData.getString(KEY_STRING))
    }
}
