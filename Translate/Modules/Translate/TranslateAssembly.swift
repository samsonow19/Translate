//
//  TranslateAssembly.swift
//  Translate
//
//  Created by Evgen on 03/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import UIKit

final class TranslateAssembly {
    
    func assembleModule() -> UIViewController {
        
        let view = TranslateViewController()
        let presenter = TranslatePresenter()

        let translateService = TranslateServiceImp()
        let databaseService = CoreDataServiceImp()
        let interactor = TranslateInteractor(translateService: translateService, databaseService: databaseService)
        
        let router = TranslateRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.transition = view
        
        return view
    }
    
}
