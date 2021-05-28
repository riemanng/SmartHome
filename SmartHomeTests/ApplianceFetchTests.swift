//
//  ApplianceFetchTests.swift
//  SmartHomeTests
//
//  Created by Константин Доронин on 28.05.2021.
//

import XCTest
import Combine

@testable import SmartHome

fileprivate final class MockApplianceService: ApplianceProvidable {
    
    var mockList: [Appliances] = [
        Appliances(id: 1, name: "name1", isActive: true, dateOfCheck: "date1", room: "room1"),
        Appliances(id: 2, name: "name2", isActive: true, dateOfCheck: "date1", room: "room2"),
        Appliances(id: 1, name: "name3", isActive: true, dateOfCheck: "date3", room: "room3"),
    ]
    
    func fetchAppliances() -> AnyPublisher<[Appliances], Never> {
        return Just(mockList).eraseToAnyPublisher()
    }
    
    
}

class ApplianceFetchTests: XCTestCase {

    var applianceViewModel: ApplianceViewModel!
    fileprivate var mockApplianceProvider: MockApplianceService!
    
    override func setUp() {
        mockApplianceProvider = MockApplianceService()
        applianceViewModel = .init(dataSource: mockApplianceProvider)
    }
    
    override func tearDown() {
        applianceViewModel = nil
        mockApplianceProvider = nil
    }
    
    func testGetAppliances() throws {
        XCTAssertTrue(applianceViewModel.list.isEmpty)
        
        var disposable = Set<AnyCancellable>()
        
        mockApplianceProvider.fetchAppliances()
            .sink { [weak self] appliances in
                self!.applianceViewModel.list = appliances
            }
            .store(in: &disposable)
        
        XCTAssertEqual(applianceViewModel.list.count, 3)
        
    }
    
}
