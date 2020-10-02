//
//  MockPodometer.swift
//  PedometerAppTests
//
//  Created by beTech CAPITAL on 17/07/20.
//  Copyright © 2020 Ezequiel Barreto. All rights reserved.
//

import Foundation
@testable import TestingIOS

class MockPodometer: Pedometer {
    private (set) var started: Bool = false
    
    func start() {
        self.started = true
    }
}
