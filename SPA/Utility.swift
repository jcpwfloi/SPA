//
//  Utility.swift
//  SPA
//
//  Created by Jingyuan Chen on 11/5/20.
//

import Foundation
import SwiftUI

//these are the utility functions

//floor/ceil the inputed double
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

//Double type utilities
extension Double{
    
    //transform the Double into a String representing a money amount with the specified length
    func toMoney(toLength: Int) -> String{
        let str = "$" + String(format: "%.0f", self)
        let len = str.count
        return String(repeating: " ", count: toLength + 1 - len) + str
    }
    
    //the version of the function above that allows decimals
    func toMoneyWithDecimal(integer: Int, decimal: Int) -> String{
        let str = "$" + String(format: "%."+String(format:"%d", decimal)+"f", self)
        let len = str.count
        return String(repeating: " ", count: integer + decimal + 2 - len) + str
    }
    
    //transform the Double into a percentage string
    func toPercent() -> String{
        return String(format: "%3.0f", self) + "%"
    }
    
    
    //transform to string directly
    func toString() -> String{
        return String(format: "%.0f", self)
    }
}

extension String{
    //transform a string to double
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
    //get rid of trailing and leading whitespaces
    func trim() -> String{
        return self.trimmingCharacters(in: .whitespaces)
    }
    
    //check if the string is a valid email
    func isValidEmail() -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}

extension View{
    //controls the visibility of the view
    @ViewBuilder func isShowing(_ showing: Bool) -> some View{
        if showing{
            self
        } else{
            self.hidden()
        }
    }
}
