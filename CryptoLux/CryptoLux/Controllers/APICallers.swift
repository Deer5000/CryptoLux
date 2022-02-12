//
//  APICaller.swift
//  CryptoLux
//
//  Created by Khidr Brinkley on 2/11/22.
//

import Foundation


final class APICaller {
    static let shared = APICaller()
    
    //URLS
    private struct Constants {
        static let assetsEndPoint = "https://api.coinpaprika.com/v1/coins"
        static let bitcoinEndPoint = "https://api.coindesk.com/v1/bpi/currentprice.json"
    }
    
    private init() {}
    
    //MARK: - Public
    
    
    // function that gets crypto data from api and makes it readable within app.
    
    public func getAllCryptoData(completion: @escaping (Result<[Crypto], Error>) -> Void
    ) {
        //create URL
        guard let url = URL(string: Constants.assetsEndPoint) else {
            return
        }
        // create a URLsession and give it task
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                // Decode response
                let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                completion(.success(cryptos))
            } catch {
                completion(.failure(error))
            }
        }
        //start task
        task.resume()
    }
    
    
    
//}
    
    
    
    public func getBitcoinData(completion: @escaping (Result<[BitCoinData], Error>) -> Void
    ) {
        //create URL
        guard let url = URL(string: Constants.bitcoinEndPoint) else {
            return
        }
        // create a UrlSession and give it a task
        let task = URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
               //Decode Response
                let btc = try JSONDecoder().decode([BitCoinData].self, from: data)
                completion(.success(btc))
            } catch {
                completion(.failure(error))
            }
        }
        // start task
        task.resume()
    }
}
