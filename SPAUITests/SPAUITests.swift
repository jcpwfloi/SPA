//
//  SPAUITests.swift
//  SPAUITests
//
//  Created by Zhongrui Chen on 2020-09-24.
//

import XCTest

class SPAUITests: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        self.app = XCUIApplication()
        self.app.launch()
    }
    
    func testLoginScreen(){
        let username = self.app.textFields["Username"]
        let password = self.app.secureTextFields["Password"]
        let button = self.app.buttons["Login"]
        username.tap()
        username.typeText("admin")
        password.tap()
        password.typeText("admin123")
        button.tap()
        let logoutButton = self.app.buttons["Logout"]
        XCTAssertTrue(logoutButton.exists)
    }
}
