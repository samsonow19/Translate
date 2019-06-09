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
    func obtainTranslations()
    func removeAllTranslation()
}


// MARK: - Interactor
final class ListTranslatesInteractor {
    
    weak var presenter: ListTranslatesInteractorOutput?
    private let databaseService: DatabaseService
 
    init(databaseService: DatabaseService) {
       self.databaseService = databaseService
    }
    
}


// MARK: - ListTranslatesInteractorInput
extension ListTranslatesInteractor: ListTranslatesInteractorInput {
    
    func obtainTranslations() {
        let translations: [TranslationModel] = databaseService.fetchModels()
        presenter?.didObtain(transitions: translations)
    }
    
    func removeAllTranslation() {
        do {
            try databaseService.deleteAllModels(for: TranslationModel.self)
        } catch {
            // TODO: - показать ошибку
        }
        
    }
}
