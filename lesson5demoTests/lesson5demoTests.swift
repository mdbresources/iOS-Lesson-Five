//
//  lesson5demoTests.swift
//  lesson5demoTests
//
//  Created by Anmol Parande on 3/5/20.
//  Copyright © 2020 Anmol Parande. All rights reserved.
//

import XCTest
@testable import lesson5demo

class MockLocationManager: LocationManager {
    func beginListening() {
        delegate?.updatedLocation(city: "Chicago", state: "IL")
    }
    
    func stopListening() {
        print("Haha, Also useless")
    }
    
    var delegate: LocationManagerDelegate?
}

class lesson5demoTests: XCTestCase {
    var locationManager: LocationManager!
    var dataManager: DataManager!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        locationManager = MockLocationManager()
        dataManager = DataManager(with: locationManager)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        locationManager.beginListening()
        XCTAssertEqual(dataManager.city, "Chicago")
        XCTAssertEqual(dataManager.state, "IL")
        locationManager.stopListening()
    }
}
