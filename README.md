# 0. Software Project Analytics
* Software Project Analytics is an iPad application that provides ways to understand software metrics that give C-Level executive managers insight into the development of large software system projects. It will be used to provide analysis and insight for software projects.

# 1. Getting Started
* Prerequisites: Xcode 12.1, Macbook with macOS 10.15.7
* Installing: 
	- In your terminal run **git clone git@github.com:jcpwfloi/SPA.git** to clone the repository
	- Open the SPA folder
	- Double click SPA.xcodeproj will open the project in Xcode
	- Click the run button on the top of the Xcode to run the project in the simulator
* Running locally:
	- You can connect your iPad by USB to your mac and select your iPad in the device drop-down list
	- If you click run, it will install SPA on your iPad and you can run it locally without connecting to your mac
	- Note: If you get an Untrusted Developer alert, you need to go to Settings > General > Profiles to trust the developer profile for OS security reasons
* Warranty: 11/12/2020 were this instruction last tested and verified to work by Team F from comp523 on macOS 10.15.7 with Xcode 12.1 and iPad Pro 10.5 with iPadOS 14.1

# 2. Testing
* How to test the project:
	- Open the Xcode project by double-clicking SPA.xcodeproj in the SPA folder
	- Open SPA_UITests.swift in the SPA-UITests folder
	- Click the diamond symbol on line 10 to run the entire UI test suit
* You can also run individual test cases by clicking the diamond symbol on the line with the test case next to the "func" keyword e.g. line 25

# 3. Deployment 
* As agreed by our client, he will be using his apple developer account to deploy the app when we’re done with the project. We cannot do so without a paid Apple developer account
* New developers can access our code from [this repo](https://github.com/jcpwfloi/SPA)
* The pre-production environment is running XCode build on the Xcode iPad simulator. 
* There is no addons other than native SwiftUI and Swift Core Data framework.
* There is no CI/CD.

# 4. Technologies used
* Swift, SwiftUI, Swift Core Data
* ADRs can be found in ADR.md in the repo or [here](https://tarheels.live/teamf/application-architecture/)

# 5. Contributing
* Repo and Trello are open to new developers
* Google has a de facto coding style guide for a wide range of languages. The language we’re using is no exception. A detailed description of the coding style is [here](https://google.github.io/swift/)
* More info on [our project website](https://tarheels.live/teamf)

# 6. Authors
* Bokai Li: User List View, Project List View, List Operations, Navigation, Environment Variables, UI Integration tests, README
* Zhongrui Chen: Core Data, Login, Register, UI Design, Computation Middleware, Optimization
* Jingyuan Chen: Computation Refactoring, Input Views, Output Views, Validation module

# 7. License
* waiting for client

# 8. Acknowledgments
* We'd like to thank Andrew Gramann as the mentor for our project and for guiding us and providing insightful feedback throughout the semester.
