//
//  Account.swift
//  TestingIOS
//
//  Created by beTech CAPITAL on 04/06/20.
//  Copyright © 2020 Ezequiel Barreto. All rights reserved.
//

import Foundation

enum AccountError:Error{
    case insufficientFounds
}

struct Account{
    var balance: Double = 0.0
    
    mutating func deposit(_ amount: Double){
        self.balance += amount
    }
    
    mutating func withdraw(_ amount: Double) throws{
        let netBalance = self.balance - amount
        if netBalance < 0{
            throw AccountError.insufficientFounds
        }else{
            self.balance -= amount
        }
    }
}
