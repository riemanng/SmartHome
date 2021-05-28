//
//  SmartHomeTests.swift
//  SmartHomeTests
//
//  Created by Константин Доронин on 11.05.2021.
//

import XCTest
import Combine
@testable import SmartHome

class SmartHomeTests: XCTestCase {
    
   
    func testBaseURL() {
        XCTAssertEqual(API.server, "http://127.0.0.1:8080/")
    }
    
    func testCanParseAppliance() throws {
        let json = """
            {
                "id": 37,
                "isActive": false,
                "dateOfCheck": "2021-05-27T05:44:00Z",
                "name": "UGABUGA Lamp X1",
                "room": "Other",
                "user": {
                  "id": 2
                }
            }
        """
        
        let jsonData = json.data(using: .utf8)!
        let applianceData = try! JSONDecoder().decode(Appliances.self, from: jsonData)
        
        XCTAssertEqual("UGABUGA Lamp X1", applianceData.name)
        XCTAssertNotEqual("", applianceData.room)
    }
}
