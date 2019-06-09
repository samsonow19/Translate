//
//  TranslationModelModel.swift
//  Translate
//
//  Created by Evgen on 08/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import Foundation

struct TranslationModel {
    
    let fromWord: WordModel
    let toWord: WordModel
    
}


extension TranslationModel: ManagedObjectTransformable {
    
    // Незаконченная идея
    var identifierKey: String {
        return "word"
    }
    
    var identifierValue: String {
        return ""
    }
    
    typealias ManagedObject = Translation
    
    init(managedObject: ManagedObject) {
        fromWord = WordModel(managedObject: managedObject.fromWord!)
        toWord = WordModel(managedObject: managedObject.toWord!)
    }
    
    func fillDbModel(managedObject: ManagedObject) {
        // TODO: додумать как сделать сохранение. Не используется
    }
    
}
