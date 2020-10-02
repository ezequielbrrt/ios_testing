//
//  PedometerAppTests.swift
//  PedometerAppTests
//
//  Created by beTech CAPITAL on 07/07/20.
//  Copyright © 2020 Ezequiel Barreto. All rights reserved.
//

import XCTest
import CoreMotion
@testable import TestingIOS

class PedometerAppTests: XCTestCase {
    
    func test_StartsPedometer() {
        
        let mockPodometer = MockPodometer()
        let pedometerVM = PedometerViewModel(pedometer: mockPodometer)
        
        pedometerVM.startPedometer()
        
        XCTAssertTrue(mockPodometer.started)
    }
    
    // MARK: - WRONG WAY
    func test_CMPedometer_LoadingHistoryData(){
        
        let now = Date()
        var data: CMPedometerData?
        let then = now.addingTimeInterval(-1000)
        let exp = expectation(description: "Pedometer returns query ... ")
        
        let pedometer = CMPedometer()
        pedometer.queryPedometerData(from: now, to: then) { (pedometerData, error) in
            data = pedometerData
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1.0)
        XCTAssertNotNil(data)
        
        if let steps = data?.numberOfSteps { XCTAssertTrue(steps.intValue > 0) }
        
    }

}
