//
//  Utility.swift
//  SPA
//
//  Created by Jingyuan Chen on 11/5/20.
//

import Foundation

func floorOrCeiling(_ x: Double) -> Double {
    
    var y = 0.0
    y = x - Double(Int(x))
    
    if y >= 0.5 {
        y = Double(Int(x) + 1)
    } else {
        y = Double(Int(x))
    }
    
    return y
    
}
