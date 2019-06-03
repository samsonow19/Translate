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

        let translateModule = TranslateAssembly().assembleModule()
        let listTranslatesModule = ListTranslatesAssmbly().assembleModule()
        
        viewControllers = [translateModule, listTranslatesModule]

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
