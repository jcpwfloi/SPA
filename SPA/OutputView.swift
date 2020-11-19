//
//  OutputView.swift
//  SPA
//
//  Created by Jingyuan Chen on 10/28/20.
//

import Foundation
import SwiftUI

struct OutputView: View{
    var name: String
    @State var text: String
    var body: some View {
        HStack{
            Text(name).bold()
            TextField("abc",text: $text).multilineTextAlignment(.trailing).allowsHitTesting(false)
        }
        
    }
}
