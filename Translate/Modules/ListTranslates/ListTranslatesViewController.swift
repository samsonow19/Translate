//
//  ListTranslatesViewController.swift
//  Translate
//
//  Created by Evgen on 03/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import UIKit


// MARK: - View Protocol
protocol ListTranslatesViewInput: AnyObject {
    func setup(with viewModel: ListTranslatesViewModel)
}


// MARK: - ListTranslatesView
final class ListTranslatesViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: ListTranslatesViewOutput?
    var dataSource: ListTranslatesDataSource?
    var searchDataSource: SearchDataSource?
    
    private let tableView = UITableView()
    private let deleteButton = UIButton()
    private let searchBar = UISearchBar()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureInterface()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
    
    
    // MARK: - UI
    
    private func configureInterface() {

        self.tabBarItem.title = "Список"
        dataSource?.setup(with: tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        deleteButton.setTitle("Очистить список переводов", for: .normal)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.addTarget(self, action: #selector(didTapDeleteButton), for: .touchDown)
        view.addSubview(deleteButton)
        
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)
        searchDataSource?.setup(searchBar: searchBar, deleage: presenter)
        
        NSLayoutConstraint.activate([

            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),

            deleteButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 0),
            
            deleteButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            deleteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            deleteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
            
        ])
        
    }
    
    // MARK: - Private methods
    
    @objc private func didTapDeleteButton() {
        presenter?.didTapDeleteButton()
    }
    
}


// MARK: - ListTranslatesViewInput
extension ListTranslatesViewController: ListTranslatesViewInput {

    func setup(with viewModel: ListTranslatesViewModel) {
        dataSource?.update(with: viewModel)
    }

}

