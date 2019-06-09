//
//  CRUDDataBase.swift
//  Translate
//
//  Created by Evgen on 06/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import CoreData

protocol DatabaseService {
    func fetchModels<T: ManagedObjectTransformable>() -> [T]
    func saveModel<T: ManagedObjectTransformable>(trnsformablemodel: T) throws
    func save(word: WordModel) throws
    func addTranslation(fromWord: WordModel, toWord: WordModel) throws
    func deleteAllModels<T: ManagedObjectTransformable>(for model: T.Type) throws
}


final class CoreDataServiceImp: DatabaseService {
    
    private let context: NSManagedObjectContext

    
    init(context: NSManagedObjectContext = CoreDataManager.context) {
        self.context = context
    }

    func fetchModels<T: ManagedObjectTransformable>() -> [T] {
    
        let request: NSFetchRequest<T.ManagedObject> = NSFetchRequest(entityName: String(describing: T.ManagedObject.self))
        
        do {
            
            let resultModel = try context.fetch(request)
            let models: [T] = resultModel.map {T.init(managedObject: $0)}
            return models
            
        } catch {
            return []
        }

    }
    
    // TODO: - к сожелению работает только для обычных данных, без связей
    func saveModel<T: ManagedObjectTransformable>(trnsformablemodel: T) throws {

        let object =  NSEntityDescription.insertNewObject(forEntityName: String(describing: T.ManagedObject.self), into: context) as! T.ManagedObject

        trnsformablemodel.fillDbModel(managedObject: object)

        do {
            try context.save()
        } catch {
            throw DataBaseError.notSave
        }

    }
    
    func deleteAllModels<T: ManagedObjectTransformable>(for model: T.Type) throws {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: T.ManagedObject.self))
        do {
            let results = try context.fetch(fetchRequest)
            
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                context.delete(objectData)
            }
        } catch {
            throw DataBaseError.noRemove
        }
        
    }
    
    func save(word: WordModel) throws {
        
        let request: NSFetchRequest<LanguagesModel.ManagedObject> = NSFetchRequest(entityName: String(describing: LanguagesModel.ManagedObject.self))
        
        do {
        
            let resultModel = try context.fetch(request)
            let lang = resultModel.first(where: { $0.language == word.lang?.identifier })
            
            let object =  NSEntityDescription.insertNewObject(forEntityName: String(describing: WordModel.ManagedObject.self), into: context) as! WordModel.ManagedObject
            
            object.word = word.word
            object.language = lang
            try context.save()
            
        } catch {
            throw DataBaseError.notSave
        }
    }
    
    func addTranslation(fromWord: WordModel, toWord: WordModel) throws {

        let object =  NSEntityDescription.insertNewObject(forEntityName: String(describing: Translation.self), into: context) as! Translation
        
        let request: NSFetchRequest<WordModel.ManagedObject> = NSFetchRequest(entityName: String(describing: WordModel.ManagedObject.self))
        
        do {
            let resultModel = try context.fetch(request)
            
            let firstWord = resultModel.first(where: { fromWord.word == $0.word })
            let secondWord = resultModel.first(where: { toWord.word == $0.word })
            
            guard let first = firstWord, let second = secondWord else {
                throw DataBaseError.notFoundWord
            }
            
            object.fromWord = first
            object.toWord = second
            
            try context.save()

        } catch {
            throw DataBaseError.notSave
        }

    }
    
}
