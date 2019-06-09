//
//  PreloadManager.swift
//  Translate
//
//  Created by Evgen on 09/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import Foundation

final class PreloadManager {
    
    private let defaults: UserDefaults
    private let keyPreload = "isFirsLoad"
    private let coreDataService: CoreDataServiceImp
    
    init(defaults: UserDefaults = UserDefaults.standard, coreDataService: CoreDataServiceImp = CoreDataServiceImp()) {
        self.defaults = defaults
        self.coreDataService = coreDataService
    }
    
    func preload() {
        
        let isFirsLoad = !defaults.bool(forKey: keyPreload)
        guard isFirsLoad else { return }
        
        do {
            
            try TranslateLanguages.allCases.forEach {
                let model = LanguagesModel(identifier: $0.rawValue)
                try coreDataService.saveModel(trnsformablemodel: model)
            }
            
            defaults.set(true, forKey: keyPreload)
     
        } catch {
            print("Error preload")
        }
    }
}
