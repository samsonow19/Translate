//
//  AppDelegate.swift
//  Translate
//
//  Created by Evgen on 03/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Для удобства использования в текущих реализацию прописываю конструкторы в инитах
        // TODO: по хорошему еще di что ыб не плодить объекты, но для этого еще время надо
        let preloadManager = PreloadManager()
        preloadManager.preload()
        
        let rootViewController = ContentModuleAssembly().assembleModule()
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
     
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        CoreDataManager.saveContext()
    }
}

