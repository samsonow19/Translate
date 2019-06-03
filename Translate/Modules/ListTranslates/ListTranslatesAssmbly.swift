//
//  ListTranslatesAssmble.swift
//  Translate
//
//  Created by Evgen on 03/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import UIKit

final class TranslateConfigurator {
    
    // MARK: - Module init WITH parameters
    
    func instantiateModuleTransitionHandler() -> UIViewController {
        
        let view = TranslateViewController()
        let presenter = TranslatePresenter()
        
        let interactor = TranslateInteractor()
        
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
