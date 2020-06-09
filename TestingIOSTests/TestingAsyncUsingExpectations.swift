//
//  TestingAsyncUsingExpectations.swift
//  TestingIOSTests
//
//  Created by beTech CAPITAL on 09/06/20.
//  Copyright © 2020 Ezequiel Barreto. All rights reserved.
//

import XCTest
@testable import TestingIOS

class TestingAsyncUsingExpectations: XCTestCase {
    
    
    func test_generates_two_notifications(){
        let alertManager = AlertManager()
        
        let exp = expectation(forNotification: Notification.Name.alertNotification, object: alertManager, handler: nil)
        
        exp.expectedFulfillmentCount = 2
        
        alertManager.postAlert()
        alertManager.postAlert()

        wait(for: [exp], timeout: 2.0)
    }
    
    func test_GetAllPost(){
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        let expectation = XCTestExpectation(description: "Post has benn downloaded")
        
        var posts = [Post]()
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data, error == nil else{
                XCTFail()
                return
            }
            
            posts = try! JSONDecoder().decode([Post].self, from: data)
            expectation.fulfill()
            
        }.resume()
        
        wait(for: [expectation], timeout: 2.0)
        XCTAssertTrue(posts.count > 0)
    }

}
