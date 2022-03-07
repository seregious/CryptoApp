//
//  CoinImageService.swift
//  CryptoApp
//
//  Created by Сергей Иванчихин on 01.03.2022.
//

import Foundation
import SwiftUI
import Combine

class CoinImageServices {
    
    @Published var image : UIImage? = nil
    
    private var imageSubcribtion: AnyCancellable?
    private let coin: CoinModel
    private let fileManadger = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName : String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage = fileManadger.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
            //print("Retrieved image from File manadger!")
        } else {
            downloadCoinImage()
            //print("Downloading image now")
        }
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image)  else {return}
        
        imageSubcribtion = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.hendleComplition, receiveValue: { [weak self] returnedImage in
                guard let self = self, let downloadImage = returnedImage else {return}
                self.image = downloadImage
                self.imageSubcribtion?.cancel()
                self.fileManadger.saveImage(image: downloadImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}
