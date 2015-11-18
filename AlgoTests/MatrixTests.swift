//
//  MatrixTests.swift
//  Algo
//
//  Created by Christopher Petersen on 11/16/15.
//  Copyright © 2015 nestedset. All rights reserved.
//

import XCTest

class MatrixTests: XCTestCase {
    var array1: [Float] = []
    var array2: [Float] = []

    override func setUp() {
        super.setUp()
        array1.append(1.0)
        array1.append(2.0)
        array1.append(3.0)
        array1.append(4.0)

        array2.append(2.0)
        array2.append(4.0)
        array2.append(6.0)
        array2.append(8.0)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        let added: [Float] = array1.addElements(array2)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
