//
//  CoinData.swift
//  CryptoTracker
//
//  Created by Vladyslav Lietun on 09.04.2020.
//  Copyright © 2020 Vladyslav Lietun. All rights reserved.
//

import UIKit

class CoinData {
    static let shared = CoinData()
    var coins = [Coin]()
    
    private init() {
        let symbols = ["BTC", "ETH"]
        
        let coinManager = CoinManager()
        
        for symbol in symbols {
            let coin = Coin(symbol: symbol)
            coins.append(coin)
        }
    }
}

class CoinManager {
    let key = ""
    let coinUrl = "https://min-api.cryptocompare.com/data/price?fsym="
    
    func fetchCoin(symbols: String) {
        performRequest(with: "\(coinUrl)\(symbols)&tsyms=USD")
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("Error \(error)")
                }
                
                if let safeData = data {
                    let decoder = JSONDecoder()
                    let coin = try decoder.decode(Coin, from: safeData)
//                    print(decodeData.USD)
                }
                
            }
            task.resume()
        }
        
    }
}

struct Coin: Decodable {
    var symbol: String = ""
    //    var image: UIImage?
    var USD: Double = 0.0
    var amount: Double = 0.0
    var historicalData = [Double]()
    
    init(symbol: String) {
        self.symbol = symbol
    }
}
