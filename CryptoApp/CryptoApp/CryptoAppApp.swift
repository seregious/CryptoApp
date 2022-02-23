//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Сергей Иванчихин on 23.02.2022.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
                    .navigationBarHidden(true)
            }
        }
    }
}
