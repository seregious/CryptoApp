//
//  Double.swift
//  CryptoApp
//
//  Created by Сергей Иванчихин on 28.02.2022.
//

import Foundation

extension Double {
    
    /// converts a double into currency with 2 decimal places
    ///```
    ///convert 1234.56 to $1,234.56
    ///```
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        //formatter.locale = .current
        //formatter.currencyCode = "usd"
        //formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    
    /// converts a double into currency as a string with 2-6 decimal places
    ///```
    ///convert 1234.56 to "$1,234.56"
    ///```
    func asCurrencywith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    /// converts a double into currency with 2-6 decimal places
    ///```
    ///convert 1234.56 to $1,234.56
    ///convert 12.3456 to $12.3456
    ///convert 0.123456 to $0.123456
    ///```
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        //formatter.locale = .current
        //formatter.currencyCode = "usd"
        //formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    
    /// converts a double into currency as a string with 2-6 decimal places
    ///```
    ///convert 1234.56 to "$1,234.56"
    ///convert 12.3456 to "$12.3456"
    ///convert 0.123456 to "$0.123456"
    ///```
    func asCurrencywith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    /// converts a double into string representation
    ///```
    ///convert 1.2345 to "1.23"
    ///```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    
    /// converts a double into string representation
    ///```
    ///convert 1.2345 to "1.23$"
    ///```
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
}
