//
//  ViewState.swift
//  SPA
//
//  Created by Jingyuan Chen on 10/15/20.
//

import Combine

class ViewState : ObservableObject {
    @Published var state: Int = 0
    @Published var model : SPAModel? = nil
}
