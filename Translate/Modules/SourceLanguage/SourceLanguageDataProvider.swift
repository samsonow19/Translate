//
//  SourceLanguageDataProvider.swift
//  Translate
//
//  Created by Evgen on 09/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import Foundation

protocol SourceLanguageDataProvider {
    func createViewModel() -> [String]
}

final class SourceLanguageDataProviderImp: SourceLanguageDataProvider {
    
    func createViewModel() -> [String] {

        let viewModel: [String] = TranslateLanguages.allCases.map { $0.rawValue }
        
        return viewModel
    }
    
}
