//
//  ContentModuleViewController.swift
//  Translate
//
//  Created by Evgen on 03/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import UIKit

final class ContentModuleViewController: UITabBarController {
    
    var previousIndex = -1
    
    override var selectedIndex: Int {
        didSet {
            if selectedIndex == 0 {
                previousIndex = -1
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInterface()
    }
    
    private func configureInterface() {

        viewControllers = config.tabControllers()
        selectedIndex =  1

        delegate = self
        tabBar.isTranslucent = false
    }
    
    
}

extension ContentModuleViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if let index = tabBarController.viewControllers?.index(of: viewController), index == 0 {
            slideMenuController.openMenu(animated: true, completion: nil)
            return false
        }
        
        return true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        if let index = tabBarController.viewControllers?.index(of: viewController) {
            let config = Config.main
            guard let menu = config.tabMenu[safe: index] else { return }
            config.selectMenuInLists(menu)
            setEmptyStabForMenuTab()
        }
        
        if previousIndex == selectedIndex, let nav = viewController as? UINavigationController {
            if nav.viewControllers.count == 1 {
                if let tabsContainer = nav.viewControllers.first as? TabsContainerViewController,
                    let scrollableVC = tabsContainer.viewControllers[safe: tabsContainer.currentIndex] as? ScrollableToTop {
                    scrollViewUp(scrollableVC)
                } else if let scrollableVC = nav.topViewController as? ScrollableToTop {
                    scrollViewUp(scrollableVC)
                }
            } else {
                nav.popToRootViewController(animated: true)
            }
        }
        
        previousIndex = selectedIndex
    }
    
    func setEmptyStabForMenuTab() {
        guard let nav = viewControllers?[0] as? BaseNavigationController, !(nav.topViewController is EmptyStabViewController) else { return }
        viewControllers?[0] = Config.main.emptyStab()
            .configure(withTabBarTitle: "Меню", tabBarIconName: "sandwich")
            .wrapHandlerToNavigation(withNavigationTitle: "Меню") as! UIViewController
    }
    
    private func scrollViewUp(_ scrollableVC: ScrollableToTop) {
        guard let scrollableAsVC = scrollableVC as? UIViewController else { return }
        if scrollableAsVC.isViewLoaded && (scrollableAsVC.view.window != nil) {
            scrollableVC.scrollUp()
        }
    }
}
