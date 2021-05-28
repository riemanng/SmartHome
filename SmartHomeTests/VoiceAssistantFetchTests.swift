//
//  VoiceAssistantFetchTests.swift
//  SmartHomeTests
//
//  Created by Константин Доронин on 28.05.2021.
//

import XCTest
import Combine

@testable import SmartHome

fileprivate final class MockAssistantsProvider: VoiceAssistantProvidable {
    var mockList: [VoiceAssistant] = [
        VoiceAssistant(id: 1, name: "name", isActive: true, message: "sleepin' for now...", room: "room"),
    ]
    
    func fetchAssistants() -> AnyPublisher<[VoiceAssistant], Never> {
        Just(mockList).eraseToAnyPublisher()
    }
}

class VoiceAssistantFetchTests: XCTestCase {
    
    var assistantsViewModel: VoiceAssistantViewModel!
    fileprivate var mockAssistanstProvider: MockAssistantsProvider!
    
    override func setUp() {
        mockAssistanstProvider = MockAssistantsProvider()
        assistantsViewModel = .init(dataSource: mockAssistanstProvider)
    }
    
    override func tearDown() {
        assistantsViewModel = nil
        mockAssistanstProvider = nil
    }
    
    func testGetAssistants() {
        XCTAssertTrue(assistantsViewModel.list.isEmpty)
        
        var disposable = Set<AnyCancellable>()
        
        mockAssistanstProvider.fetchAssistants()
            .sink { [weak self] assistants in
                self!.assistantsViewModel.list = assistants
            }
            .store(in: &disposable)
        
        XCTAssertEqual(assistantsViewModel.list[0].message, "sleepin' for now...")
    }

}
