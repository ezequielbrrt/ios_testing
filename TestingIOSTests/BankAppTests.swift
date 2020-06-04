//
//  TestingIOSTests.swift
//  TestingIOSTests
//
//  Created by beTech CAPITAL on 03/06/20.
//  Copyright © 2020 Ezequiel Barreto. All rights reserved.
//

import XCTest
@testable import TestingIOS

class BankAppTests: XCTestCase {

    private var account: Account!
    
    override func setUp() {
        super.setUp()
        self.account = Account()
    }
    
    func test_WithdrawWithInsufficientFunds(){
        self.account.deposit(100)
        
        XCTAssertThrowsError(try self.account.withdraw(300)){ error in
            XCTAssertEqual(error as! AccountError, AccountError.insufficientFounds)
        }
        
    }
    
    func test_WithdrawFunds(){
        self.account.deposit(100)
        try! self.account.withdraw(50)
        
        XCTAssertEqual(50, self.account.balance)
    }
    
    func test_InitialBalanceZero(){
        XCTAssertEqual(0, self.account.balance)
    }
    
    func test_DepositFunds(){
        self.account.deposit(100)
        XCTAssertEqual(100, self.account.balance)
    }
    
    
    override func tearDown() {
        super.tearDown()
        
    }
}
