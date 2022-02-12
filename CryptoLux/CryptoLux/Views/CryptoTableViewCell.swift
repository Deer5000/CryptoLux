//
//  CryptoTableViewCell.swift
//  CryptoLux
//
//  Created by Khidr Brinkley on 2/11/22.
//

import UIKit

struct CryptoTableViewCellViewModel {
    let name: String
    let symbol: String
    let rank: Int
}


class CryptoTableViewCell: UITableViewCell {
    static let identifier = "CryptoTableViewCell"
    
    // Subviews
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .medium)
        return label
    }()
    
    private let symbolLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .systemBrown
        return label
    }()
    
    // Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(symbolLabel)
        contentView.addSubview(rankLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    // Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLabel.sizeToFit()
        symbolLabel.sizeToFit()
        rankLabel.sizeToFit()
        
        nameLabel.frame = CGRect(x: 5, y: 0, width: contentView.frame.size.width/2, height: contentView.frame.size.height/2)
        
        symbolLabel.frame = CGRect(x: 5, y: contentView.frame.size.height/2, width: contentView.frame.size.width/2, height: contentView.frame.size.height/2)
        
        rankLabel.frame = CGRect(x: contentView.frame.width/2, y: 0, width: (contentView.frame.size.width/2) - 5, height: contentView.frame.size.height)
    }
    
    // Configure
    
    func configure(with viewModel: CryptoTableViewCellViewModel) {
        nameLabel.text = viewModel.name
        symbolLabel.text = viewModel.symbol
        rankLabel.text = String(viewModel.rank)
    }

}
