//
//  ChartView.swift
//  CryptoApp
//
//  Created by Сергей Иванчихин on 07.03.2022.
//

import SwiftUI

struct ChartView: View {
    
    let data : [Double]
    let maxY : Double
    let minY : Double
    let lineColor : Color
    let startingDate : Date
    let endingDate : Date
    
    init (coin: CoinModel) {
        data = coin.sparklineIn7D?.price ?? []
        maxY = data.max() ?? 0
        minY = data.min() ?? 0
        
        let priceChange = (data.last ?? 0) - (data.first ?? 0)
        lineColor = priceChange >= 0 ? Color.theme.green : Color.theme.red
        
        endingDate = Date(coinGeckoString: coin.lastUpdated ?? "")
        startingDate = endingDate.addingTimeInterval(7*24*60*60)
    }

    
    var body: some View {
        VStack {
        chartView
            .frame(height: 200)
            .background(chartBackground)
            .overlay(chartYAxis, alignment: .leading)
            
            chartDateLabels
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(coin: dev.coin)
    }
}

extension ChartView {
    private var chartView : some View {
        GeometryReader {geometry in
            Path {path in
                for index in data.indices {
                    
                    let xPosition = geometry.size.width / CGFloat(data.count) * CGFloat(index + 1)
                    
                    let yAxis = maxY - minY
                    
                    let yPosition = (1 - CGFloat((data[index] - minY) / yAxis)) * geometry.size.height
                    
                    if index == 0 {
                        path.move(to: CGPoint(x: xPosition, y: yPosition))
                    }
                    path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                    }
                }
            .trim(from: 0, to: 1)
            .stroke(Color.blue, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
            }
    }
    
    private var chartBackground : some View {
        VStack{
            Divider()
            Spacer()
            Divider()
            Spacer()
            Divider()
        }
    }
    
    private var chartYAxis : some View {
        VStack {
           Text("\(maxY)")
            Spacer()
            Text("\((maxY - minY) / 2)")
            Spacer()
            Text("\(minY)")
        }
    }
    
    private var chartDateLabels : some View {
        HStack{
            Text(startingDate.asShortDateString())
            Spacer()
            Text(endingDate.asShortDateString())
        }
    }
}