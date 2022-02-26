//
//  HomeView.swift
//  CryptoApp
//
//  Created by Сергей Иванчихин on 24.02.2022.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio = false
    
    var body: some View {
        ZStack {
            //background
            Color.theme.background
                .ignoresSafeArea()
            
            //content layer
            VStack {
                HStack {
                    CircleButtonView(iconImage: showPortfolio ? "plus" : "info")
                        .animation(.none)
                        .background(
                        CircleButtonAnimationView(animate: $showPortfolio)
                        )
                    Spacer()
                    Text(showPortfolio ? "Portfolio" : "Live Prices")
                        .font(.headline)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.theme.accent)
                        //.animation(.none)
                    Spacer()
                    CircleButtonView(iconImage: "chevron.right")
                        .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                        .onTapGesture {
                            withAnimation(.spring()) {
                            showPortfolio.toggle()
                            }
                        }
                }
                .padding(.horizontal)
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
