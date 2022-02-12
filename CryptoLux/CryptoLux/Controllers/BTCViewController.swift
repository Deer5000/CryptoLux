//
//  BTCViewController.swift
//  CryptoLux
//
//  Created by Khidr Brinkley on 2/12/22.
//

import Foundation
import UIKit

class BTCViewController: UIViewController {
    
    @IBOutlet weak var BitcoinRateLabel: UILabel!
    @IBOutlet weak var BitcoinTimestampLabel: UILabel!
    @IBOutlet weak var BtcImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "BitCoin Tracker"
    }
    
    
    
    @IBAction func updateButtonPressed(_ sender: Any) {
        let randomInt = Int.random(in: 40000..<45000)
        
        //gets current date/time
        let currentDateTime = Date()
        
        //Initializes date formatter and set the style
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        
        //Gets the date and time STring from the date Object
        let dateTimeString = formatter.string(from: currentDateTime)
        
        
        print("get btc price")
        BitcoinRateLabel.text = String("$\(randomInt)")
        BitcoinTimestampLabel.text = dateTimeString
    }
}





//        APICaller.shared.getBitcoinData { [weak self] result in
//            switch result {
//            case .success(let BitCoinData):
//                self?.BitcoinRateLabel.text = BitCoinData.description
//                self?.BitcoinTimestampLabel.text = String(BitCoinData.count)
//
//            case .failure(let error):
//                print("Error: \(error)")
//        }

//}
    
    
    



