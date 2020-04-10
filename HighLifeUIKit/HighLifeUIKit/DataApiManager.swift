//
//  DataManager.swift
//  HighLifeUIKit
//
//  Created by Vladyslav Lietun on 10.04.2020.
//  Copyright © 2020 Vladyslav Lietun. All rights reserved.
//

import Foundation

protocol DataApiMangerDelegate {
    func didUpdateData(dataApi: DataApi)
}

struct DataApiManger {
    private let url = "https://api-football-v1.p.rapidapi.com"
    private let headers = [
        "x-rapidapi-host": "api-football-v1.p.rapidapi.com",
        "x-rapidapi-key": "82656a9d22mshb7a8150a0b61499p10ed81jsn3d97135f85c5"
    ]
    
    var delegate: DataApiMangerDelegate?
    
//    func getAllCountries() -> DataApi {
//        return performRequest(with: "\(url)/v2/countries")!
//    }
    
    func performRequest() -> DataApi? {
        let request = NSMutableURLRequest(url: NSURL(string: "\(url)/v2/countries")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            if error != nil {
                fatalError("\(String(describing: error?.localizedDescription))")
            }
            
            if let responseData = data {
                if let dataApi = self.parseJSON(responseData) {
                    self.delegate?.didUpdateData(dataApi: dataApi)
                }
            }
        }
        
        dataTask.resume()
        return nil
    }
    
    func parseJSON(_ data: Data) -> DataApi? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(DataApi.self, from: data)
            
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print("error: ", error)
        }
        return nil
    }
}
