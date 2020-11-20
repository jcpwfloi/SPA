//
//  SPA_UITests.swift
//  SPA-UITests
//
//  Created by Bokai Li on 11/6/20.
//

import XCTest

class SPA_UITests: XCTestCase {
    
    var app = XCUIApplication()
    let del = XCUIKeyboardKey.delete.rawValue
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func touch(xloc: Double, yloc : Double){
        app.tapCoordinate(at: CGPoint(x: xloc, y: yloc))
        
    }
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    func tLoginView(){
        let username = app.textFields["Username"]
        let password = app.secureTextFields["Password"]
        let loginButton = app.buttons["Login"]
        let clearButton = app.buttons["Clear"]
        let emailBox = app.textFields["EmailField"]
        let passwordRegistration = app.secureTextFields["PasswordField"]
        let confirmPassword = app.secureTextFields["ConfirmPasswordField"]
        let registerButton = app.buttons["Register"]
        let formClear = app.buttons["FormClear"]
        registerButton.tap()
        touch(xloc: 10.0, yloc: 50.0)
        
        let formRegister = app.buttons["FormRegister"]
        let gotButton = app.buttons["Got it!"]

        
        //Test empty input
        registerButton.tap()
        formRegister.tap()
        gotButton.tap()
        touch(xloc: 10.0, yloc: 50.0)
        
        let pass = "123456"
        
        //Test wrong email
        let wrongEmail = "wrong"
        registerButton.tap()
        emailBox.tap()
        emailBox.typeText(wrongEmail)
        passwordRegistration.tap()
        passwordRegistration.typeText(pass)
        confirmPassword.tap()
        confirmPassword.typeText(pass)
        formRegister.tap()
        gotButton.tap()
        formClear.tap()
        
        //Test mismatched password
        let rightEmail = "a@b.com"
        emailBox.tap()
        emailBox.typeText(rightEmail)
        passwordRegistration.tap()
        passwordRegistration.typeText(pass)
        confirmPassword.tap()
        confirmPassword.typeText(pass + "1")
        formRegister.tap()
        gotButton.tap()
        formClear.tap()
        
        //Test right registration
        let newEmail = randomString(length: 3) + "@" + randomString(length: 5) + ".com"
        emailBox.tap()
        emailBox.typeText(newEmail)
        passwordRegistration.tap()
        passwordRegistration.typeText(pass)
        confirmPassword.tap()
        confirmPassword.typeText(pass)
        formRegister.tap()
        
        
        //Test repeated registration
        registerButton.tap()
        formRegister.tap()
        gotButton.tap()
        touch(xloc: 10.0, yloc: 50.0)
        
        //test clear
        username.tap()
        username.typeText("abc")
        password.tap()
        password.typeText("password")
        clearButton.tap()
        
        //test wrong log in
        let randEmail = randomString(length: 7)
        username.tap()
        username.typeText(randEmail)
        password.tap()
        password.typeText(pass)
        loginButton.tap()
        gotButton.tap()
        
        //test real log in
        clearButton.tap()
        username.tap()
        username.typeText(newEmail)
        password.tap()
        password.typeText(pass)
        loginButton.tap()
    }
    
    func tUserListView(){
        //test add user
        let userList = app.tables["UserList"]
        var numUsers = userList.children(matching: .cell).count
        let AddButton = app.buttons["Add a user"]
        
        AddButton.tap()
        let newusername = app.textFields["new user field"]
        newusername.tap()
        
        //Add a new user
        numUsers += 1
        let testUsername = "TESTuser" + randomString(length: 8)
        newusername.typeText(testUsername)
        let subAddButton = app.buttons["Add"]
        subAddButton.tap()
        
        
        XCTAssertEqual(numUsers, userList.children(matching: .cell).count)
        
        //Add existed user
        AddButton.tap()
        newusername.tap()
        
        subAddButton.tap()
        app.buttons["UserDismiss"].tap();
        
        
        XCTAssertEqual(numUsers, userList.children(matching: .cell).count)
        
        //Test Delete user
        let tablesQuery = userList.cells
        tablesQuery.element(boundBy: 0).swipeLeft()
        tablesQuery.element(boundBy: 0).buttons["Delete"].tap()
        app.buttons["Delete"].tap()
        XCTAssertEqual(numUsers - 1, userList.children(matching: .cell).count)
        
        //Add another new user
        let testUsername2 = "TESTuser" + randomString(length: 8)
        AddButton.tap()
        newusername.tap()
        for i in 1...testUsername2.count{
            newusername.typeText(del)
        }
        newusername.typeText(testUsername2)
        subAddButton.tap()
        XCTAssertEqual(numUsers, userList.children(matching: .cell).count)
        
        //test navigation link
        let user1 = userList.cells.element(boundBy: 0)
        user1.tap()
    }
    
    func tProjectListView(){
        let projectList = app.tables["ProjectList"]
        
        //test add new project
        var numProjects = projectList.children(matching: .cell).count
        let testProjectname = "TESTproject" + randomString(length: 8)
        let AddButtonProject = app.buttons["Add Project"]
        AddButtonProject.tap()
        let newproject = app.textFields["new project field"]
        newproject.tap()
        newproject.typeText(testProjectname)
        let subAddProjectButton = app.buttons["Add"]
        subAddProjectButton.tap()
//        app.buttons["ProjectDismiss"].tap()
        numProjects += 1
        XCTAssertEqual(numProjects, projectList.children(matching: .cell).count)
        
        //Add an existed project
        AddButtonProject.tap()
        newproject.tap()
        subAddProjectButton.tap()
        app.buttons["ProjectDismiss"].tap();
        XCTAssertEqual(numProjects, projectList.children(matching: .cell).count)
        
        //test project delete
        let tablesQuery2 = projectList.cells
        tablesQuery2.element(boundBy: 0).swipeLeft()
        tablesQuery2.element(boundBy: 0).buttons["Delete"].tap()
        app.buttons["Delete"].tap()
        XCTAssertEqual(numProjects - 1, projectList.children(matching: .cell).count)
        
        //Add another new project
        let testProjectname2 = "TESTproject" + randomString(length: 8)
        AddButtonProject.tap()
        newproject.tap()
        for i in 1...testProjectname2.count{
            newproject.typeText(del)
        }
        newproject.typeText(testProjectname2)
        subAddProjectButton.tap()
        XCTAssertEqual(numProjects, projectList.children(matching: .cell).count)
        //test navigation link
        let project1 = app.tables.cells.element(boundBy: 0)
        project1.tap()
    }
    
    func tRawInputView(){
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
    }
    
    func testIntegration(){
        app.launch()
//        addUIInterruptionMonitor(withDescription: "Dialog"){
//            (alert) -> Bool in
//            if alert.buttons["OK"].exists{
//                alert.buttons["OK"].tap()
//            }
//            if alert.buttons["Delete"].exists{
//                alert.buttons["Delete"].tap()
//            }
//            return true
//        }
        
        tLoginView()
        tUserListView()
        tProjectListView()
        tRawInputView()
        
        
        
        //Test Executive Screen
        app.tabBars.buttons.element(boundBy: 1).tap()
        //Test Management Screen
        app.tabBars.buttons.element(boundBy: 2).tap()
        //Test Practitioner Screen
        app.tabBars.buttons.element(boundBy: 3).tap()
        //Test Derived Input
        app.tabBars.buttons.element(boundBy: 0).tap()
        app.buttons["Log off"].tap()
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

extension Int{
    func toString()->String{
        return String(format: "%d",self)
    }
}
