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
    
    func testIntegration(){
        let username = self.app.textFields["Username"]
        let password = self.app.secureTextFields["Password"]
        let loginButton = self.app.buttons["Login"]
        //test log in
        username.tap()
        username.typeText("admin")
        password.tap()
        password.typeText("admin123")
        loginButton.tap()
        
        //delete all existing users
        while(self.app.tables.children(matching: .cell).count != 0){
            let tablesQuery = app.tables.cells
            tablesQuery.element(boundBy: 0).swipeLeft()
            tablesQuery.element(boundBy: 0).buttons["Delete"].tap()
        }
        //test add user
        let AddButton = self.app.buttons["Add"]
        AddButton.tap()
        let newusername = self.app.textFields["new"]
        newusername.tap()
        newusername.typeText("user1")
        let subAddButton = self.app.buttons["subAdd"]
        subAddButton.tap()
        XCTAssertEqual(1, self.app.tables.children(matching: .cell).count)
        //test delete user
        AddButton.tap()
        newusername.tap()
        newusername.typeText(XCUIKeyboardKey.delete.rawValue+"2")
        subAddButton.tap()
        let tablesQuery = app.tables.cells
        tablesQuery.element(boundBy: 0).swipeLeft()
        tablesQuery.element(boundBy: 0).buttons["Delete"].tap()
        XCTAssertEqual(1, self.app.tables.children(matching: .cell).count)
        //test navigation link
        let user1 = self.app.tables.cells.element(boundBy: 0)
        user1.tap()
        //test add project
        while(self.app.tables.children(matching: .cell).count != 0){
            let tablesQuery = app.tables.cells
            tablesQuery.element(boundBy: 0).swipeLeft()
            tablesQuery.element(boundBy: 0).buttons["Delete"].tap()
        }
        let AddButtonProject = self.app.buttons["AddProject"]
        AddButtonProject.tap()
        let newproject = self.app.textFields["newProject"]
        newproject.tap()
        newproject.typeText("project1")
        let subAddProjectButton = self.app.buttons["subAddProject"]
        subAddProjectButton.tap()
        AddButtonProject.tap()
        newproject.tap()
        newproject.typeText(XCUIKeyboardKey.delete.rawValue+"2")
        subAddProjectButton.tap()
        XCTAssertEqual(2, self.app.tables.children(matching: .cell).count)
        //test project delete
        let tablesQuery2 = app.tables.cells
        tablesQuery2.element(boundBy: 0).swipeLeft()
        tablesQuery2.element(boundBy: 0).buttons["Delete"].tap()
        XCTAssertEqual(1, self.app.tables.children(matching: .cell).count)
        //test navigation link
        let project1 = self.app.tables.cells.element(boundBy: 0)
        project1.tap()
        //Test Generate button
        let generateButton = self.app.buttons["Generate"]
        generateButton.tap()
        //Test Executive Screen
        self.app.tabBars.buttons.element(boundBy: 1).tap()
        //Test Management Screen
        self.app.tabBars.buttons.element(boundBy: 2).tap()
        //Test Practitioner Screen
        self.app.tabBars.buttons.element(boundBy: 3).tap()
        //Test Derived Input
        self.app.tabBars.buttons.element(boundBy: 0).tap()
        //LogOff This button currently exit the app
        self.app.buttons["Logout"].tap()
        //XCTAssertTrue(loginButton.exists)
    }
}
