//
//  UIApplication.swift
//  CryptoApp
//
//  Created by Сергей Иванчихин on 05.03.2022.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
