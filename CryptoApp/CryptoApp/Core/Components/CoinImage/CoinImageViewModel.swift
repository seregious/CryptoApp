//
//  CoinImageViewModel.swift
//  CryptoApp
//
//  Created by Сергей Иванчихин on 01.03.2022.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel : ObservableObject {
    @Published var image : UIImage? = nil
    @Published var isloading = false
    
    private let coin: CoinModel
    private let dataService : CoinImageServices
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.dataService = CoinImageServices(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        
        dataService.$image
            .sink {[weak self] _ in
                self?.isloading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
        
    }
}
