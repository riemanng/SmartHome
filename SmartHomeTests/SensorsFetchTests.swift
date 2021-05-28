//
//  SensorsFetchTests.swift
//  SmartHomeTests
//
//  Created by Константин Доронин on 28.05.2021.
//

import XCTest
import Combine

@testable import SmartHome

fileprivate final class MockSensorProvider: SensorProvidable {
    var mockList: [Sensors] = [
        Sensors(id: 1, name: "name", isActive: false, dateOfCheck: "", room: "room"),
        Sensors(id: 1, name: "name", isActive: false, dateOfCheck: "", room: "room"),
    ]
    
    func fetchSensors() -> AnyPublisher<[Sensors], Never> {
        Just(mockList).eraseToAnyPublisher()
    }
}

class SensorsFetchTests: XCTestCase {
    
    var sensorsViewModel: SensorViewModel!
    fileprivate var mockSensorProvider: MockSensorProvider!
    
    override func setUp() {
        mockSensorProvider = MockSensorProvider()
        sensorsViewModel = .init(dataSource: mockSensorProvider)
    }
    
    override func tearDown() {
        sensorsViewModel = nil
        mockSensorProvider = nil
    }
    
    func testGetSensors() {
        XCTAssertFalse(!sensorsViewModel.list.isEmpty)
        
        var disposable = Set<AnyCancellable>()
        
        mockSensorProvider.fetchSensors()
            .sink { [weak self] sensors in
                self!.sensorsViewModel.list = sensors
            }
            .store(in: &disposable)
    }
}
