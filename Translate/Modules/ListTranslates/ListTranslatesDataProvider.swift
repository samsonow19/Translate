//
//  ListTranslatesDataProvider.swift
//  Translate
//
//  Created by Evgen on 08/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import Foundation

protocol ListTranslatesDataProvider {
    func viewModel(for entities: [TranslationModel]) -> ListTranslatesViewModel
}

final class ListTranslatesDataProviderImp: ListTranslatesDataProvider {

    func viewModel(for entities: [TranslationModel]) -> ListTranslatesViewModel {
        
        let resultRows: [ListTranslatesRow] = entities.map { wordModel in
            
            let firstWord = wordModel.fromWord.word ?? ""
            let secondWord = wordModel.toWord.word ?? ""
            
            let model = ListTranslateCell.Model(firstWord: firstWord, secondWord:secondWord)
            let row = ListTranslatesRow(type: .translate(model), height: ListTranslateCell.height)
            
            return row
        }
        
        return ListTranslatesViewModel.init(rows: resultRows)
        
    }
        
}

