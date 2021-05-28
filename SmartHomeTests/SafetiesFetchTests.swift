//
//  SafetiesFetchTests.swift
//  SmartHomeTests
//
//  Created by Константин Доронин on 28.05.2021.
//

import XCTest
import Combine

@testable import SmartHome

fileprivate final class MockSensorsProvider: SafetyProvidable {
    
    var mockList: [Safety] = [
        Safety(id: 1, name: "name1", isActive: true, room: "room1"),
        Safety(id: 2, name: "name2", isActive: false, room: "room2"),
        Safety(id: 3, name: "name3", isActive: true, room: "room3"),
        Safety(id: 4, name: "name4", isActive: false, room: "room4"),
    ]
    
    func fetchSafeties() -> AnyPublisher<[Safety], Never> {
        return Just(mockList).eraseToAnyPublisher()
    }
    
    
}

class SafetiesFetchTests: XCTestCase {

    var safetiesViewModel: SafetyViewModel!
    fileprivate var mockSafetyProvider: MockSensorsProvider!
    
    override func setUp() {
        mockSafetyProvider = MockSensorsProvider()
        safetiesViewModel = .init(dataSource: mockSafetyProvider)
    }
    
    override func tearDown() {
        safetiesViewModel = nil
        mockSafetyProvider = nil
    }
    
    func testGetAppliances() throws {
        XCTAssertTrue(safetiesViewModel.list.isEmpty)
        
        var disposable = Set<AnyCancellable>()
        
        mockSafetyProvider.fetchSafeties()
            .sink { [weak self] safeties in
                self!.safetiesViewModel.list = safeties
            }
            .store(in: &disposable)
        
        XCTAssertEqual(safetiesViewModel.list.count, 4)
        
    }
    
}
