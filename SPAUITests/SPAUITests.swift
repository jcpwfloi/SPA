//
//  SPAUITests.swift
//  SPAUITests
//
//  Created by Zhongrui Chen on 2020-09-24.
//

import XCTest

class SPAUITests: XCTestCase {

//    private var app: XCUIApplication!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testIntegration(){
        let app  = XCUIApplication()
        app.launch()
        let username = app.textFields["Username"]
        let password = app.secureTextFields["Password"]
        let loginButton = app.buttons["Login"]
        //test log in
        username.tap()
        username.typeText("admin")
        password.tap()
        password.typeText("admin123")
        loginButton.tap()
        
        //delete all existing users
        while(app.tables.children(matching: .cell).count != 0){
            let tablesQuery = app.tables.cells
            tablesQuery.element(boundBy: 0).swipeLeft()
            tablesQuery.element(boundBy: 0).buttons["Delete"].tap()
        }
        //test add user
        let AddButton = app.buttons["Add"]
        AddButton.tap()
        let newusername = app.textFields["newUser"]
        newusername.tap()
        newusername.typeText("user1")
        let subAddButton = app.buttons["Add User"]
        subAddButton.tap()
        XCTAssertEqual(1, app.tables.children(matching: .cell).count)
        //test delete user
        AddButton.tap()
        newusername.tap()
        newusername.typeText(XCUIKeyboardKey.delete.rawValue+"2")
        subAddButton.tap()
        let tablesQuery = app.tables.cells
        tablesQuery.element(boundBy: 0).swipeLeft()
        tablesQuery.element(boundBy: 0).buttons["Delete"].tap()
        XCTAssertEqual(1, app.tables.children(matching: .cell).count)
        //test navigation link
        let user1 = app.tables.cells.element(boundBy: 0)
        user1.tap()
        //test add project
        while(app.tables.children(matching: .cell).count != 0){
            let tablesQuery = app.tables.cells
            tablesQuery.element(boundBy: 0).swipeLeft()
            tablesQuery.element(boundBy: 0).buttons["Delete"].tap()
        }
        let AddButtonProject = app.buttons["Add Project"]
        AddButtonProject.tap()
        let newproject = app.textFields["newProject"]
        newproject.tap()
        newproject.typeText("project1")
        let subAddProjectButton = app.buttons["subAddProject"]
        subAddProjectButton.tap()
        AddButtonProject.tap()
        newproject.tap()
        newproject.typeText(XCUIKeyboardKey.delete.rawValue+"2")
        subAddProjectButton.tap()
        XCTAssertEqual(2, app.tables.children(matching: .cell).count)
        //test project delete
        let tablesQuery2 = app.tables.cells
        tablesQuery2.element(boundBy: 0).swipeLeft()
        tablesQuery2.element(boundBy: 0).buttons["Delete"].tap()
        XCTAssertEqual(1, app.tables.children(matching: .cell).count)
        //test navigation link
        let project1 = app.tables.cells.element(boundBy: 0)
        project1.tap()
        //Test Generate button
        let generateButton = app.buttons["Generate"]
        generateButton.tap()
        //Test Executive Screen
        app.tabBars.buttons.element(boundBy: 1).tap()
        //Test Management Screen
        app.tabBars.buttons.element(boundBy: 2).tap()
        //Test Practitioner Screen
        app.tabBars.buttons.element(boundBy: 3).tap()
        //Test Derived Input
        app.tabBars.buttons.element(boundBy: 0).tap()
        //LogOff This button currently exit the app
        app.buttons["Logout"].tap()
        //XCTAssertTrue(loginButton.exists)
    }
}
