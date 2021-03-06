//
//  CircleButton.swift
//  CryptoApp
//
//  Created by Сергей Иванчихин on 26.02.2022.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconImage : String
    
    var body: some View {
        Image(systemName: iconImage)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(Color.theme.background)
            )
            .shadow(
                color: Color.theme.accent.opacity(0.25),
                radius: 10, x: 0, y: 0)
            .padding()
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        Group{
        CircleButtonView(iconImage: "plus")
            .padding()
            .previewLayout(.sizeThatFits)

            CircleButtonView(iconImage: "plus")
                .padding()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
