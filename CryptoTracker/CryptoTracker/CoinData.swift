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
        
        CoinManager().fetchCoin(symbols: symbols[0])
        
        for symbol in symbols {
            let coin = Coin(symbol: symbol)
            coins.append(coin)
        }
    }
}

class Coin: Decodable {
    var symbol: String = ""
    //    var image: UIImage?
    var price: Double = 0.0
    var amount: Double = 0.0
    var historicalData = [Double]()
    
    init(symbol: String) {
        self.symbol = symbol
    }
}

class CoinManager {
    let key = ""
    let coinUrl = "https://min-api.cryptocompare.com/data/price?fsym="
    
    func fetchCoin(symbols: String) {
        performRequest(with: "\(coinUrl)\(symbols)tsyms=USD")
    }
    
    private func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("Error \(String(describing: error))")
                    return
                }
                
                if let safeData = data {
                    if let coin = self.parseJSON(safeData) {
                        print(coin)
                    }
                }
            }
            task.resume()
        }
    }
    
    private func parseJSON(_ coinData: Data) -> Coin? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(Coin.self, from: coinData)
            
            print(decodeData)
            //
            //            let id = decodeData.weather[0].id
            //            let temp = decodeData.main.temp - 273.15
            //            let name = decodeData.name
            //
            //            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            
            return nil
            
        } catch {
            return nil
        }
    }
}
