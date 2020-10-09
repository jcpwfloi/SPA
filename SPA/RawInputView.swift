//
//  RawInputView.swift
//  SPA
//
//  Created by Jingyuan Chen on 10/7/20.
//

import SwiftUI



struct InputView: View{
    var name: String
    var placeholder: String
    var spacerWidth : CGFloat = 20.0
    var labelWidth : CGFloat = 300.0
    @Binding var textInput: String
    var body: some View {
        HStack{
            
            HStack{
                Spacer().frame(width: spacerWidth)
                Text(name)
                    .font(.headline)
            }
            
            .frame(width:labelWidth, alignment: .bottomTrailing)
            
            Spacer().frame(width: spacerWidth)
            TextField(placeholder, text: $textInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer().frame(width: spacerWidth)
        }.padding()
    }
}

//extension HorizontalAlignment{
//    private enum
//}
struct RawInputView: View {
    @State var projectName : String = ""
    @State var programmingLanguage : String = ""
    @State var avgAnnualSalary : String = ""
    @State var teamSize : String = ""
    @State var ncnbSLOC : String = ""
    @State var requirementsAndDesignEffort : String = ""
    @State var developmentEffort : String = ""
    @State var findDefectEffort : String = ""
    @State var reworkEffort : String = ""
    @State var issueEffort : String = ""
    @State var postReleaseIndicator : String = ""
    func disabled()->Bool{
        return projectName.isEmpty ||
            programmingLanguage.isEmpty ||
            avgAnnualSalary.isEmpty  ||
            teamSize.isEmpty ||
            ncnbSLOC.isEmpty ||
            requirementsAndDesignEffort.isEmpty ||
            developmentEffort.isEmpty ||
            findDefectEffort.isEmpty ||
            reworkEffort.isEmpty ||
            issueEffort.isEmpty ||
            postReleaseIndicator.isEmpty
    }
    var body: some View {
        
        VStack {
            HStack{
                Button(action: {}){
                    Text("Back")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        
                }
                Spacer()
                Button(action: {
                    exit(0)
                }){
                    Text("Log off")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        
                }
            }.padding(.leading, 80)
            .padding(.trailing, 60)
            .padding(.bottom, 100)
            Group{
                InputView(name: "Project Name", placeholder: "project name", textInput: $projectName)
                InputView(name: "Programming Language", placeholder: "programming language", textInput: $programmingLanguage)
                InputView(name: "Average Annual Salary", placeholder: "average annual salary",textInput: $avgAnnualSalary)
                InputView(name: "Team Size", placeholder: "team size",textInput: $teamSize)
                InputView(name: "NonCommentNonBlankSLOC", placeholder: "number",textInput: $ncnbSLOC)
                InputView(name: "Requirenents and Design Effort", placeholder: "design effort",textInput: $requirementsAndDesignEffort)
                InputView(name: "Development Effort", placeholder: "development effort",textInput: $developmentEffort)
                InputView(name: "Find Defect Effort", placeholder: "find deffect effort",textInput: $findDefectEffort)
                InputView(name: "Rework Effort", placeholder: "rework effort",textInput: $reworkEffort)
                InputView(name: "Issue Count", placeholder: "issue count",textInput: $issueEffort)
            }

            InputView(name: "Post-Release Indicator", placeholder: "post-release indicator",textInput: $postReleaseIndicator)
            HStack{
                Button(action: {
                    print(projectName)
                }){
                    Text(" Derived Input ")
                        .font(.title2)
                        
                }.padding()
                .disabled(disabled())
                Button(action: {}){
                    Text(" Executive ")
                        .font(.title2)
                }.padding()
                .disabled(disabled())
                Button(action: {}){
                    Text(" Management ")
                        .font(.title2)

                }.padding()
                .disabled(disabled())
                Button(action: {}){
                    Text(" Practitioner ")
                        .font(.title2)
                }.padding()
                .disabled(disabled())
            }.padding(30)

        }
    }
}

struct RawInputView_Previews: PreviewProvider {
    static var previews: some View {
        RawInputView()
    }
}
