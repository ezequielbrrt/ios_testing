//
//  AlertManager.swift
//  TestingIOS
//
//  Created by beTech CAPITAL on 09/06/20.
//  Copyright © 2020 Ezequiel Barreto. All rights reserved.
//

import Foundation

class AlertManager{
    func postAlert(){
        NotificationCenter.default.post(name: Notification.Name.alertNotification, object: self)
    }

}

extension Notification.Name{
    static let alertNotification = Notification.Name("alertPostedNotification")
}
