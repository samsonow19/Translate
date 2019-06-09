//
//  ListTranslatesSearchDataSource.swift
//  Translate
//
//  Created by Evgen on 10/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import UIKit

protocol SearchDataSourceOutpute: AnyObject {
    func textDidChange(searchText: String)
    func searchCanceled()
}

protocol SearchDataSource {
    func setup(searchBar: UISearchBar, deleage: SearchDataSourceOutpute?)
}

final class ListTranslatesSearchDataSourceImp: NSObject, SearchDataSource {
    
    private weak var deleage: SearchDataSourceOutpute?
    
    func setup(searchBar: UISearchBar, deleage: SearchDataSourceOutpute?) {
        searchBar.delegate = self
        self.deleage = deleage
    }

}

extension ListTranslatesSearchDataSourceImp: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        deleage?.searchCanceled()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        deleage?.textDidChange(searchText: searchText)
    }
    
}
