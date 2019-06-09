//
//  SourceLanguagePresenter.swift
//  Translate
//
//  Created by Evgen on 09/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import Foundation

// MARK: - Protocols
protocol SourceLanguageViewOutput {
    func viewDidLoad()
    func didSelectFromLanguage(identifier: String)
    func didSelectToLanguage(identifier: String)
}

protocol SourceLanguageInteractorOutput: AnyObject {
    
}


// MARK: - Presenter
final class SourceLanguagePresenter {
    
    // MARK: - Properties
    
    weak var view: SourceLanguageViewInput?
    var router: SourceLanguageRouterInput?
    
    private var fromLanguage: TranslateLanguages?
    private var toLanguage: TranslateLanguages?
    private let dataProvider: SourceLanguageDataProvider
    private let interactor: SourceLanguageInteractorInput
    
    init(dataProvider: SourceLanguageDataProvider, interactor: SourceLanguageInteractorInput) {
        self.dataProvider = dataProvider
        self.interactor = interactor
    }
    
}


// MARK: - SourceLanguageViewOutput
extension SourceLanguagePresenter: SourceLanguageViewOutput {
    
    func viewDidLoad() {
        let model = dataProvider.createViewModel()
        let fromLanguage = interactor.getCurentFromLanguage()
        let toLanguage = interactor.getCurentToLanguage()
        view?.update(with: model, from: fromLanguage ,to: toLanguage)
    }
    
    func didSelectFromLanguage(identifier: String) {
        guard let language = TranslateLanguages(rawValue: identifier) else { return }
        interactor.updateCurent(from: language)
    }
    
    func didSelectToLanguage(identifier: String) {
        guard let language = TranslateLanguages(rawValue: identifier) else { return }
        interactor.updateCurent(to: language)
    }
    
}


// MARK: - SourceLanguageInteractorOutput
extension SourceLanguagePresenter: SourceLanguageInteractorOutput {
    
    
}
