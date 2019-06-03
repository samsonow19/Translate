//
//  TranslateInteractor.swift
//  Translate
//
//  Created by Evgen on 03/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import Foundation

// MARK: - Protocol
protocol TranslateInteractorInput: AnyObject {
    func translation(word: String, fromLang: String, toLang: String)
}


// MARK: - Interactor
final class TranslateInteractor {
    
    weak var presenter: TranslateInteractorOutput?
    private let translateService: TranslateService
    
    init(translateService: TranslateService) {
        self.translateService = translateService
    }
}


// MARK: - TranslateInteractorInput
extension TranslateInteractor: TranslateInteractorInput {
    
    func translation(word: String, fromLang: String, toLang: String) {
        
        let success: (WordTranslation) -> Void = { [weak self] translation in
            
            DispatchQueue.main.async {
                self?.presenter?.didSuccssesTransition(translation: translation)
            }
        }
        
        let failure: (Error?) -> Void = { _ in
            // TODO: - ну в прочем много туду
        }
        
        translateService.translation(word: word, fromLang: fromLang, toLang: toLang, success: success, failure: failure)
        
    }
    
}
