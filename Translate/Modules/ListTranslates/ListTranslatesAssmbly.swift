//
//  ListTranslatesAssmble.swift
//  Translate
//
//  Created by Evgen on 03/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import UIKit

final class ListTranslatesAssmbly {
    
    func assembleModule() -> UIViewController {
        
        let view = ListTranslatesViewController()
        let presenter = ListTranslatesPresenter()
        
        let interactor = ListTranslatesInteractor()
        
        let router = ListTranslatesRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.transition = view
        
        return view
    }
    
}
