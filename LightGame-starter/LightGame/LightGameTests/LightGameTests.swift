//
//  lightGameTests.swift
//  LightGameTests
//
//  Created by Martina on 22/05/22.
//

import XCTest
@testable import LightGame


var sut: ViewController!


class lightGameTests: XCTestCase {

    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
        sut = ViewController()
        
    }

    
    override func tearDownWithError() throws {
        
        sut = nil
        try super.tearDownWithError()
    
    }

    
    func testAdjacent() throws {
        
        // 1 -
        let segments = sut.calcTrig(segment: .x, size: 10, angle: 45)
        
        // 2 -
        let y = round(segments[.y]!)
        let h = round(segments[.h]!)
        
        // 3 -
        XCTAssert(y==10)
        XCTAssert(h==14)
        
    }
    
    func testOpposite() throws {
        
        // 1 -
        let segments = sut.calcTrig(segment: .y, size: 10, angle: 45)
        
        // 2 -
        let x = round(segments[.x]!)
        let h = round(segments[.h]!)
        
        // 3 -
        XCTAssert(x==10)
        XCTAssert(h==14)
        
    }
    
    func testHypothenuse() throws {
        
        // 1 -
        let segments = sut.calcTrig(segment: .h, size: 14.14, angle: 45)
        
        // 2 -
        let x = round(segments[.x]!)
        let y = round(segments[.y]!)
        
        // 3 -
        XCTAssert(x==10)
        XCTAssert(y==10)
        
    }

}
