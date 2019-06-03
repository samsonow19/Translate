//
//  ListTranslatesPresenter.swift
//  Translate
//
//  Created by Evgen on 03/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import Foundation

// MARK: - Protocols
protocol ListTranslatesViewOutput {
    
    
}

protocol ListTranslatesInteractorOutput: AnyObject {
    
}


// MARK: - Presenter
final class ListTranslatesPresenter {
    
    // MARK: - Properties
    
    weak var view: ListTranslatesViewInput?
    
    var interactor: ListTranslatesInteractorInput?
    var router: ListTranslatesRouterInput?
    
}


// MARK: - ListTranslatesViewOutput
extension ListTranslatesPresenter: ListTranslatesViewOutput {
    
    
}


// MARK: - ListTranslatesInteractorOutput
extension ListTranslatesPresenter: ListTranslatesInteractorOutput {
    
    
}
