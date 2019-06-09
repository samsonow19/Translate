//
//  LocalStorageService.swift
//  Translate
//
//  Created by Evgen on 09/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import Foundation

final class LocalStorageService {
    
    static let shared = LocalStorageService()
    
    var fromLanguage: TranslateLanguages = .ru
    var toLanguage: TranslateLanguages = .en
    
    private init() {}

}
