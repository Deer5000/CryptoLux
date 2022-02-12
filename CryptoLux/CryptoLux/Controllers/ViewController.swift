//
//  ViewController.swift
//  CryptoLux
//
//  Created by Khidr Brinkley on 2/11/22.
//

import UIKit

//API Caller
//
//(https://api.coindesk.com/v1/bpi/currentprice.json) BTC price with timestamp

// (https://api.coinpaprika.com/v1/coins) various other digital currencies.

//UI to show different cryptos

//TableView


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // basic tableView setup
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CryptoTableViewCell.self, forCellReuseIdentifier: CryptoTableViewCell.identifier)
        return tableView
    }()
    
    // creates a cell(viewModel) for each item recieved from Api
    private var viewModels = [CryptoTableViewCellViewModel]()
    
    //screen load up settings/funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CryptoLux Tracker"
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        //function call used to get data from API and map it to UI elements.
        APICaller.shared.getAllCryptoData { [weak self] result in
            switch result {
            case .success(let CoinData):
                self?.viewModels = CoinData.compactMap({
                    CryptoTableViewCellViewModel(
                        name: $0.name ?? "No data", symbol: $0.symbol ?? "No data", rank: $0.rank ?? 000)
                })
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                //Error handling
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    //Sets up frame for table view
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    //TableView
    
    //Neccessary func for tableView to work properly(numOfRows and info thats going to be in each cell)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTableViewCell.identifier,for: indexPath)
        as? CryptoTableViewCell else {
            fatalError()
        }
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
}

