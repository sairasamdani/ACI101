//
//  MinutesTests.swift
//  MinutesTests
//
//  Created by Samdani, Saira on 2020-05-30.
//  Copyright © 2020 Microsoft. All rights reserved.
//

import XCTest
@testable import Minutes

class MinutesTests: XCTestCase {

    var entryUnderTest: Entry!
    
    override func setUpWithError() throws {
        super.setUp()
        entryUnderTest = Entry("Hello", "World")
    }

    override func tearDownWithError() throws {
        entryUnderTest = nil
        super.tearDown()
    }

    func testSerialization() {
        let serializedData = FileEntryStore.serialize(entryUnderTest)
        let entry = FileEntryStore.deserialize(serializedData!)
        
        XCTAssertEqual(entry?.title, "Hello")
        XCTAssertEqual(entry?.content, "World")
    }

}
