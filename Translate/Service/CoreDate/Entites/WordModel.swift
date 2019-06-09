//
//  WordModel.swift
//  Translate
//
//  Created by Evgen on 08/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import Foundation
import CoreData

struct WordModel  {
    let word: String?
    let lang: LanguagesModel?
}

extension WordModel: ManagedObjectTransformable {
    
    // Незаконченная идея
    var identifierKey: String {
        return "word"
    }
    
    var identifierValue: String {
        return word ?? ""
    }

    typealias ManagedObject = Word
    
    init(managedObject: ManagedObject) {
        
        word = managedObject.word
        if let language = managedObject.language {
            lang = LanguagesModel(managedObject: language)
        } else {
            lang = nil
        }
       
    }
    
    func fillDbModel(managedObject: ManagedObject) {
        managedObject.word = word
    }
    
}
