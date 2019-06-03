//
//  ListTranslatesInteractor.swift
//  Translate
//
//  Created by Evgen on 03/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import Foundation

// MARK: - Protocol
protocol ListTranslatesInteractorInput: AnyObject {
    
}


// MARK: - Interactor
final class ListTranslatesInteractor {
    
    weak var presenter: ListTranslatesInteractorOutput?
    
}


// MARK: - ListTranslatesInteractorInput
extension ListTranslatesInteractor: ListTranslatesInteractorInput {
    
    
}
