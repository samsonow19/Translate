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
    
    //func setup(with viewModel: ListTranslatesViewModel)
}


// MARK: - ListTranslatesView
final class ListTranslatesViewController: UIViewController, ListTranslatesViewInput {
    
    // MARK: - Properties
    
    var presenter: ListTranslatesViewOutput?
    
   // private var viewModel: ListTranslatesViewModel?
    private let tableView = UITableView()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureInterface()
       // presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // presenter?.viewWillAppear()
    }
    
    
    // MARK: - UI
    
    private func configureInterface() {

        self.tabBarItem.title = "Список"
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        // FIXME: - REGISTER CELLS
        view.addSubview(tableView)
       
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
    }
    
    
    // MARK: - Private methods
    
    
    
}


// MARK: - DataSource
extension ListTranslatesViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
}


// MARK: - Delegate
extension ListTranslatesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}


//// MARK: - ListTranslatesViewInput
//extension ListTranslatesViewController: ListTranslatesViewInput {
//
//    func setup(with viewModel: ListTranslatesViewModel) {
//
//        self.viewModel = viewModel
//        tableView.reloadData()
//    }
//
//}
