//
//  TranslatePresenter.swift
//  Translate
//
//  Created by Evgen on 03/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import Foundation

// MARK: - Protocols
protocol TranslateViewOutput {
    func didTaptranslateButton(with word: String)
}

protocol TranslateInteractorOutput: AnyObject {
    func didSuccssesTransition(translation: WordTranslation)
}


// MARK: - Presenter
final class TranslatePresenter {
    
    // MARK: - Properties
    
    weak var view: TranslateViewInput?
    
    var interactor: TranslateInteractorInput?
    var router: TranslateRouterInput?
    
}


// MARK: - TranslateViewOutput
extension TranslatePresenter: TranslateViewOutput {
    
    func didTaptranslateButton(with word: String) {
        interactor?.translation(word: word, fromLang: "ru", toLang: "en")
    }
    
}


// MARK: - TranslateInteractorOutput
extension TranslatePresenter: TranslateInteractorOutput {
    
    func didSuccssesTransition(translation: WordTranslation) {
        let translation = translation.text.first ?? ""
        view?.setup(transition: translation)
    }
    
}
