//
//  SourceLanguageAssembly.swift
//  Translate
//
//  Created by Evgen on 09/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import UIKit

final class SourceLanguageAssembly {
    
    func assembleModule() -> UIViewController {
        
        let view = SourceLanguageViewController()
        let dataProvider = SourceLanguageDataProviderImp()

        let interactor = SourceLanguageInteractor()
        let presenter = SourceLanguagePresenter(dataProvider: dataProvider, interactor: interactor)
        
        let router = SourceLanguageRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.transition = view
        
        return view
    }
    
}
