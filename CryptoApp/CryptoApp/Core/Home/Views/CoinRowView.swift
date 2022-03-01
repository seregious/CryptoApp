//
//  CoinRowView.swift
//  CryptoApp
//
//  Created by Сергей Иванчихин on 28.02.2022.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin : CoinModel
    let showHoldingsColumn : Bool
    
    var body: some View {
        HStack(spacing: 0) {
            
            leftColumn
            
            Spacer()
            
            if showHoldingsColumn {
                centralColumn
            }
            
            rightColumn
        }
        .font(.subheadline)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}


extension CoinRowView {
    
    private var leftColumn : some View {
        HStack {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(width: 30)
            Circle()
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accent)
        }
    }
    
    private var centralColumn : some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencywith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundColor(Color.theme.accent)
    }
    
    private var rightColumn : some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencywith6Decimals())
                .foregroundColor(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
