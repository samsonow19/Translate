//
//  ListTranslatesPresenter.swift
//  Translate
//
//  Created by Evgen on 03/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import Foundation

// MARK: - Protocols
protocol ListTranslatesViewOutput: SearchDataSourceOutpute {
    func viewWillAppear()
    func didTapDeleteButton()
    
}

protocol ListTranslatesInteractorOutput: AnyObject {
    func didObtain(transitions: [TranslationModel])
}


// MARK: - Presenter
final class ListTranslatesPresenter {
    
    // MARK: - Properties
    
    weak var view: ListTranslatesViewInput?
    
    var interactor: ListTranslatesInteractorInput?
    var router: ListTranslatesRouterInput?
    
    private let dataProvider: ListTranslatesDataProvider
    private var transitions: [TranslationModel] = []
    
    init(dataProvider: ListTranslatesDataProvider) {
        self.dataProvider = dataProvider
    }
}


// MARK: - ListTranslatesViewOutput
extension ListTranslatesPresenter: ListTranslatesViewOutput {

    func viewWillAppear() {
        obtainEntities()
    }
    
    private func obtainEntities() {
        interactor?.obtainTranslations()
    }
    
    func didTapDeleteButton() {
        interactor?.removeAllTranslation()
        obtainEntities()
    }
    
}


// MARK: - ListTranslatesInteractorOutput
extension ListTranslatesPresenter: ListTranslatesInteractorOutput {
    
    func didObtain(transitions: [TranslationModel]) {
        self.transitions = transitions
        let viewModel = dataProvider.viewModel(for: transitions)
        view?.setup(with: viewModel)
    }
    
}


// MARK: - ListTranslatesInteractorOutput
extension ListTranslatesPresenter: SearchDataSourceOutpute {
    
    func textDidChange(searchText: String) {
        
        let updateModel = transitions.filter {
            $0.fromWord.word?.contains(searchText) ?? false || $0.toWord.word?.contains(searchText) ?? false
        }
        
        let viewModel = dataProvider.viewModel(for: updateModel)
        view?.setup(with: viewModel)
    }
    
    func searchCanceled() {
        let viewModel = dataProvider.viewModel(for: transitions)
        view?.setup(with: viewModel)
    }
    
}



