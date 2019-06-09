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
    func translate(word: String)
}


// MARK: - Interactor
final class TranslateInteractor {
    
    weak var presenter: TranslateInteractorOutput?
    private let translateService: TranslateService
    private let localStorageService: LocalStorageService
    private let databaseService: DatabaseService
    
    init(translateService: TranslateService, localStorageService: LocalStorageService = LocalStorageService.shared, databaseService: DatabaseService) {
        self.translateService = translateService
        self.localStorageService = localStorageService
        self.databaseService = databaseService
    }
}


// MARK: - TranslateInteractorInput
extension TranslateInteractor: TranslateInteractorInput {
    
    func translate(word: String) {
        
        let fromLang = localStorageService.fromLanguage.rawValue
        let toLang = localStorageService.toLanguage.rawValue
        
        let success: (WordTranslation) -> Void = { [weak self] translation in
            
            DispatchQueue.main.async {
                self?.presenter?.didSuccssesTransition(translation: translation)
                
                let fromLangModel = LanguagesModel(identifier: fromLang)
                let toLangModel = LanguagesModel(identifier: toLang)
                
                let fromWord = WordModel(word: word, lang: fromLangModel)
                let translation = translation.text.first ?? ""
                let toWord = WordModel(word: translation, lang: toLangModel)
                
                do {
                    
                    try self?.databaseService.save(word: fromWord)
                    try self?.databaseService.save(word: toWord)
                    
                    try self?.databaseService.addTranslation(fromWord: fromWord, toWord: toWord)
                } catch {
                    print("show error saving data")
                    // show error saving data
                }
                
            }
        }
        
        let failure: (Error?) -> Void = { _ in
            // TODO: - ну в прочем много туду
        }

        translateService.translation(word: word, fromLang: fromLang, toLang: toLang, success: success, failure: failure)
        
    }
    
}
