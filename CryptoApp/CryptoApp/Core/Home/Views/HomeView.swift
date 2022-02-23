//
//  HomeView.swift
//  CryptoApp
//
//  Created by Сергей Иванчихин on 24.02.2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            //background
            Color.theme.background
                .ignoresSafeArea()
            
            //content layer
            VStack {
                Text("Header")
                Spacer(minLength: 0)
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        HomeView()
                .navigationBarHidden(true)
        }
    }
}
