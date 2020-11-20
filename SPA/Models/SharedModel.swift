//
//  ViewState.swift
//  SPA
//
//  Created by Jingyuan Chen on 10/15/20.
//

import Combine

//This is a wrapper class around the current SPAModel
//It is used as a global state

class SharedModel : ObservableObject {
    @Published var model : SPAModel? = nil
    func setModel(model : SPAModel){
        self.model = model
    }
}
