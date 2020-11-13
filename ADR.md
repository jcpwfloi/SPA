# Here are the 3 ADRs we’ve come up with:

## Core Data for data persistence
1. Summary – In order to store data persistently, we decided to use Swift Core Data. 
2. Problem – We need to make the data persistent because data should appear on the screen after the user restart the application as our client requested. It is not easy because we need to decide whether we want to write it to the disk or have it somewhere in the cloud.
3. Constraints – We have a bunch of solutions available in hand: SQL, local storage, cloud storage, and Swift Core Data. As for SQL and local storage, they’re not easy to implement, hard to maintain, and may bring in code challenges. Cloud storage is viable but our client didn’t ask us to do so.
4. Options – Thus, Core Data by Swift comes in handy because it is a built-in model we can use and it’s stable after several version iterations. However, if we somehow need to migrate the data to databases in the future, Core Data won’t be that easy. Cloud-based solutions may have better migration support than Core Data, but we’ll have to load third-party libraries on XCode for that, plus integration of cloud-based solutions may be more difficult than the native Core Data.
5. Rationale -We select Core Data for our application because it’s native and it’s easy to use.

## UI and front end: SwiftUI
1. Summary – In order to design a user-friendly user interface, we decided to use SwiftUI framework.
2. Problem – This app requires us to present a large amount of data in the limited space on an iPad screen in an organized way. Therefore, we have to leverage good space management and design layout with precise alignments. Also, due to the demand for user data input on multiple screens, we have to design user-friendly UI components that are easily replicable and reconfigurable. 
3. Constraints – We are expected to write a native iPad application with configurable  UI components. Also the screen space are limited for a large amount of data.
4. Options – Possible alternatives include: Handwritten XML, Storyboard facility, Materialize, and SwiftUI.
5. Rationale – We choose to use SwiftUI since it achieves better tradeoffs between precision and configurability, since it could be used as a declarative language tool that describes UI components with good precision and can be easily replicated. It’s also more suitable than web front end design frameworks such as Materialize since it is native to the iOS system and could use Object-C facilities directly. However, since SwiftUI is only constrained to the iOS system, we lose a certain degree of flexibility and platform independence. If we are supposed to migrate the application to a different platform or support adaptive UI design on different platforms, SwiftUI might not be the most desirable decision.

## Programming language
1. Summary – In order to integrate with the SPA prototype backend and provide the best user experience, we decided to use swift as our main programming language.
2. Problem – We need to use a language that is most compatible with our backend code, SPA prototype. We also need a language that is well supported in the iPadOS environment that can handle both front and backend well. We also need a language that can provide a great user experience and a code base that is easy to manage.
3. Constraints – The constraint is our client expects us to build a native application running iPad. The other constraint is that we have to integrate the backend that our client provided for us.
4. Options – Objective-c requires less code adaptation to work with Apple’s existing APIs. But it is harder to maintain and read as objective-c code is not as succinct as swift. React native allows our app to run on multiple platforms but it is prone to have issues with the frontend layout, responsiveness, and reliability as it is not native to the iPadOS.
5. Rationale – Our backend, SPA prototype, is programmed in swift by our client. This will make the backend frontend integration much smoother and easier. Swift runs faster and is native to iOS/iPadOS. It is easier to read and learn. It has better memory management and is safer. Therefore we picked swift.
