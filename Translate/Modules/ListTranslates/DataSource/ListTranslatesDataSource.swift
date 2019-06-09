//
//  DataSource.swift
//  Translate
//
//  Created by Evgen on 09/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import UIKit

protocol ListTranslatesDataSource {
    func setup(with tableView: UITableView)
    func update(with viewModel: ListTranslatesViewModel) 
}

final class ListTranslatesDataSourceImp: NSObject, ListTranslatesDataSource {
    
    private var viewModel: ListTranslatesViewModel?
    private var tableView: UITableView?
    
    func setup(with tableView: UITableView) {
        
        let identifier = String(describing: ListTranslateCell.self)
        
        tableView.register(ListTranslateCell.self, forCellReuseIdentifier: identifier)
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView = tableView
        
    }
    
    func update(with viewModel: ListTranslatesViewModel) {
        self.viewModel = viewModel
        tableView?.reloadData()
    }
    
}

// MARK: - DataSource
extension ListTranslatesDataSourceImp: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.rows.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cellModel = viewModel?.rows[indexPath.row],
            let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.type.identifier) as? ListTranslateCell else { return UITableViewCell() }
        
        cell.setup(cellModel.type.setupObject)
        
        return cell
    }
    
}


// MARK: - Delegate
extension ListTranslatesDataSourceImp: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight(for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight(for: indexPath)
    }
    
    private func cellHeight(for indexPath: IndexPath) -> CGFloat {
        return viewModel?.rows[indexPath.row].height ?? 0
    }
    
}
