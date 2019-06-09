//
//  LanguagesModel.swift
//  Translate
//
//  Created by Evgen on 07/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import Foundation
import CoreData

struct LanguagesModel {
    var identifier: String?
}

extension LanguagesModel: ManagedObjectTransformable {
    
    // Незаконченная идея с identifier
    var identifierKey: String {
        return "lang"
    }
    
    var identifierValue: String {
        return identifier ?? ""
    }
    
    typealias ManagedObject = Language
    
    init(managedObject: ManagedObject) {
        identifier = managedObject.language
    }
    
    func fillDbModel(managedObject: ManagedObject) {
        managedObject.language = identifier
    }
    
}

