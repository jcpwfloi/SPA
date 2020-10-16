//
//  ProjectListView.swift
//  SPA
//
//  Created by Bokai Li on 10/9/20.
//

import SwiftUI

struct ProjectListView: View{
    var user: String
    var body: some View{
        List(projects[user]!, id: \.self){ project in
            NavigationLink(
                destination: RawInputView()){
            Text(project)
            }
        }.navigationBarTitle(Text("Project List"))
    }
}
//#if DEBUG
//struct ProjectListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProjectListView(user: "U1")
//    }
//}
//#endif
