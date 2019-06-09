//
//  ManagedObjectTransformable.swift
//  Translate
//
//  Created by Evgen on 07/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import CoreData

protocol ManagedObjectTransformable {
    associatedtype ManagedObject: NSManagedObject
    var identifierKey: String { get }
    var identifierValue: String { get }
    init(managedObject: ManagedObject)
    func fillDbModel(managedObject: ManagedObject)
}

