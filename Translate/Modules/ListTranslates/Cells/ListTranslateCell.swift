//
//  ListTranslateCell.swift
//  Translate
//
//  Created by Evgen on 08/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import UIKit

final class ListTranslateCell: UITableViewCell {
    
    static let height = UITableView.automaticDimension
    
    // MARK: - Model
    
    struct Model {
        let firstWord: String
        let secondWord: String
    }
    
    // MARK: - Subviews
    
    private let firstWordLabel = UILabel()
    private let secondWordLabel = UILabel()
    
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: nil)
        drawSelf()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        drawSelf()
    }
    
    
    // MARK: - Drawing
    
    private func drawSelf() {
        
        firstWordLabel.translatesAutoresizingMaskIntoConstraints = false
        firstWordLabel.contentMode = .left
        contentView.addSubview(firstWordLabel)
        
        secondWordLabel.translatesAutoresizingMaskIntoConstraints = false
        firstWordLabel.contentMode = .right
        contentView.addSubview(secondWordLabel)
        
        NSLayoutConstraint.activate([
            
            firstWordLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            firstWordLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            firstWordLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            secondWordLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            secondWordLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            secondWordLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            secondWordLabel.leftAnchor.constraint(equalTo: firstWordLabel.rightAnchor, constant: -20)
            
            ])
        
    }
    
}


// MARK: - Setupable
extension ListTranslateCell {
    
    func setup(_ model: Model) {
        firstWordLabel.text = model.firstWord
        secondWordLabel.text = model.secondWord
    }
    
}

