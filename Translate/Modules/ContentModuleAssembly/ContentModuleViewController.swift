//
//  ContentModuleViewController.swift
//  Translate
//
//  Created by Evgen on 03/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import UIKit

final class ContentModuleViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInterface()
    }
    
    private func configureInterface() {
        
        let sourceLanguageModule = SourceLanguageAssembly().assembleModule()
        sourceLanguageModule.tabBarItem.title = "Выбор"

        let translateModule = TranslateAssembly().assembleModule()
        translateModule.tabBarItem.title = "Переводчик"
        
        let listTranslatesModule = ListTranslatesAssembly().assembleModule()
        listTranslatesModule.tabBarItem.title = "Список"
        
        viewControllers = [sourceLanguageModule, translateModule, listTranslatesModule]

        delegate = self
        tabBar.isTranslucent = false
    }
    
}

extension ContentModuleViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        return true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    }
    
}
