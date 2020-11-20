//
//  SPA_UITests.swift
//  SPA-UITests
//
//  Created by Bokai Li on 11/6/20.
//

import XCTest
@testable import SPA

class SPA_UITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testIntegration(){
        let app  = XCUIApplication()
        app.launch()
        addUIInterruptionMonitor(withDescription: "Dialog"){
            (alert) -> Bool in
            if alert.buttons["OK"].exists{
                alert.buttons["OK"].tap()
            }
            if alert.buttons["Delete"].exists{
                alert.buttons["Delete"].tap()
            }
            return true
        }
        let username = app.textFields["Username"]
        let password = app.secureTextFields["Password"]
        let loginButton = app.buttons["Login"]
        let clearButton = app.buttons["Clear"]
        
        let registerButton = app.buttons["Register"]
        registerButton.tap()
        
        app.tapCoordinate(at: CGPoint(x: 10.0, y: 50.0))
        
        //test log in
        username.tap()
        username.typeText("abc")
        password.tap()
        password.typeText("password")
        clearButton.tap()
        username.tap()
        username.typeText("SofTechMetrics@gmail.com")
        password.tap()
        password.typeText("Admin")
        loginButton.tap()
    
        //test add user
        let AddButton = app.buttons["Add a user"]
        AddButton.tap()
        let newusername = app.textFields["new user field"]
        newusername.tap()
        newusername.typeText("user1")
        let subAddButton = app.buttons["Add"]
        subAddButton.tap()
        
        if(app.buttons["Dismiss"].exists){
            app.buttons["Dismiss"].tap();
        }
        
        //test delete project
        AddButton.tap()
        newusername.tap()
        newusername.typeText(XCUIKeyboardKey.delete.rawValue+"2")
        subAddButton.tap()
        if(app.buttons["Dismiss"].exists){
            app.buttons["Dismiss"].tap();
        }
        let tablesQuery = app.tables.cells
        tablesQuery.element(boundBy: 0).swipeLeft()
        tablesQuery.element(boundBy: 0).buttons["Delete"].tap()
        
        //test navigation link
        let user1 = app.tables.cells.element(boundBy: 0)
        user1.tap()
        
        //test add project
        let AddButtonProject = app.buttons["Add Project"]
        AddButtonProject.tap()
        let newproject = app.textFields["new project field"]
        newproject.tap()
        newproject.typeText("project1")
        let subAddProjectButton = app.buttons["Add"]
        subAddProjectButton.tap()
        if(app.buttons["Dismiss"].exists){
            app.buttons["Dismiss"].tap();
        }
        AddButtonProject.tap()
        newproject.tap()
        newproject.typeText(XCUIKeyboardKey.delete.rawValue+"2")
        subAddProjectButton.tap()
        if(app.buttons["Dismiss"].exists){
            app.buttons["Dismiss"].tap();
        }
        //test project delete
        let tablesQuery2 = app.tables.cells
        tablesQuery2.element(boundBy: 0).swipeLeft()
        tablesQuery2.element(boundBy: 0).buttons["Delete"].tap()
        //test navigation link
        let project1 = app.tables.cells.element(boundBy: 0)
        project1.tap()
        
        let generateButton = app.buttons["Generate"]
        
        //Test blank inputs and invalid inputs
        let teamSize = app.textFields["Team Size"]
        XCTAssertTrue(teamSize.exists)
        teamSize.doubleTap()
        teamSize.typeText(XCUIKeyboardKey.delete.rawValue)
        XCTAssertFalse(generateButton.isEnabled)
        
        teamSize.typeText("N")
        XCTAssertTrue(generateButton.isEnabled)
        generateButton.tap()
        //Alert handled by Interruption Monitor
        teamSize.doubleTap()
        teamSize.typeText(XCUIKeyboardKey.delete.rawValue)
        teamSize.typeText("9")
        XCTAssertTrue(generateButton.isEnabled)
        
        //Test Generate button
        
        generateButton.tap()
        //Test Executive Screen
        app.tabBars.buttons.element(boundBy: 1).tap()
        //Test Management Screen
        app.tabBars.buttons.element(boundBy: 2).tap()
        //Test Practitioner Screen
        app.tabBars.buttons.element(boundBy: 3).tap()
        //Test Derived Input
        app.tabBars.buttons.element(boundBy: 0).tap()
        
    }
}

extension XCUIApplication {
    func tapCoordinate(at point: CGPoint) {
        let normalized = coordinate(withNormalizedOffset: .zero)
        let offset = CGVector(dx: point.x, dy: point.y)
        let coordinate = normalized.withOffset(offset)
        coordinate.tap()
    }
}
