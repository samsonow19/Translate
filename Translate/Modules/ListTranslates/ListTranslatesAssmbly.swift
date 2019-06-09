//
//  ListTranslatesAssmble.swift
//  Translate
//
//  Created by Evgen on 03/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import UIKit

final class ListTranslatesAssembly {
    
    func assembleModule() -> UIViewController {
        
        let view = ListTranslatesViewController()
        let dataProvider = ListTranslatesDataProviderImp()
        let presenter = ListTranslatesPresenter(dataProvider: dataProvider)
        
        let interactor = ListTranslatesInteractor(databaseService: CoreDataServiceImp())
        
        let router = ListTranslatesRouter()
        
        view.presenter = presenter
        let tableDataSource = ListTranslatesDataSourceImp()
        let searchDataSource = ListTranslatesSearchDataSourceImp()
        view.dataSource = tableDataSource
        view.searchDataSource = searchDataSource
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.transition = view
        
        return view
    }
    
}
