//
//  SourceLanguageInteractor.swift
//  Translate
//
//  Created by Evgen on 09/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import Foundation


// MARK: - Protocol
protocol SourceLanguageInteractorInput: AnyObject {
    
    func getCurentFromLanguage() -> TranslateLanguages
    func getCurentToLanguage() -> TranslateLanguages
    func updateCurent(from language: TranslateLanguages)
    func updateCurent(to language: TranslateLanguages)
}


// MARK: - Interactor
final class SourceLanguageInteractor {
    
    weak var presenter: SourceLanguageInteractorOutput?
    
    private let localStorageService = LocalStorageService.shared
    
}


// MARK: - SourceLanguageInteractorInput
extension SourceLanguageInteractor: SourceLanguageInteractorInput {
    
    func getCurentFromLanguage() -> TranslateLanguages {
        return localStorageService.fromLanguage
    }
    
    func getCurentToLanguage() -> TranslateLanguages {
        return localStorageService.toLanguage
    }
    
    func updateCurent(from language: TranslateLanguages) {
        localStorageService.fromLanguage = language
    }
    
    func updateCurent(to language: TranslateLanguages) {
       localStorageService.toLanguage = language
    }
    
}
