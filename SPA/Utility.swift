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

extension Double{
    func toMoney(toLength: Int) -> String{
        let str = "$" + String(format: "%.0f", self)
        let len = str.count
        return String(repeating: " ", count: toLength + 1 - len) + str
    }
    func toMoneyWithDecimal(integer: Int, decimal: Int) -> String{
        let str = "$" + String(format: "%."+String(format:"%d", decimal)+"f", self)
        let len = str.count
        return String(repeating: " ", count: integer + decimal + 2 - len) + str
    }
    
    func toPercent() -> String{
        return String(format: "%3.0f", self) + "%"
    }
    
    func toString() -> String{
        return String(format: "%.0f", self)
    }
}

extension String{
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
    func trim() -> String{
        return self.trimmingCharacters(in: .whitespaces)
    }
    func isValidEmail() -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}
