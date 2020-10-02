//
//  PedometerVIewModel.swift
//  TestingIOS
//
//  Created by beTech CAPITAL on 17/07/20.
//  Copyright © 2020 Ezequiel Barreto. All rights reserved.
//

import Foundation
import CoreMotion

class PedometerViewModel {
    var pedometer: Pedometer
    
    init(pedometer: Pedometer) {
        self.pedometer = pedometer
    }
    
    func startPedometer() {
        self.pedometer.start()
    }
}
