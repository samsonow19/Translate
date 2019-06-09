//
//  SourceLanguageViewController.swift
//  Translate
//
//  Created by Evgen on 09/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import UIKit

// MARK: - View Protocol
protocol SourceLanguageViewInput: AnyObject {
    func update(with model: [String], from: TranslateLanguages, to: TranslateLanguages)
}


// MARK: - SourceLanguageView
final class SourceLanguageViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: SourceLanguageViewOutput?
    private let pickerView = UIPickerView()
    private var modelsPikerView: [String] = []
    private let fromLanguageTextField = UITextField()
    private let toLanguageTextField = UITextField()
    private let languageDataSource = SourceLanguageDataSource()


    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureInterface()
        view.backgroundColor = .white
        presenter?.viewDidLoad()
    }

    
    // MARK: - UI
    
    private func configureInterface() {
        
        self.tabBarItem.title = "Выбор"
        
        pickerView.dataSource = languageDataSource
        pickerView.delegate = languageDataSource
        
        fromLanguageTextField.placeholder = "Перевести с"
        fromLanguageTextField.translatesAutoresizingMaskIntoConstraints = false
        fromLanguageTextField.inputView = pickerView
        
        let fromLanguageToolBar = UIToolbar()
        
        fromLanguageToolBar.barStyle = UIBarStyle.default
        fromLanguageToolBar.isTranslucent = true
        fromLanguageToolBar.tintColor = UIColor.black
        fromLanguageToolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(didTapFromLanguageDone))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        fromLanguageToolBar.setItems([ spaceButton, doneButton], animated: false)
        fromLanguageToolBar.isUserInteractionEnabled = true
        
        fromLanguageTextField.inputAccessoryView = fromLanguageToolBar
        
        view.addSubview(fromLanguageTextField)

        toLanguageTextField.placeholder = "Перевести на"
        toLanguageTextField.translatesAutoresizingMaskIntoConstraints = false
        toLanguageTextField.inputView = pickerView
        
        let toLanguageToolBar = UIToolbar()
        
        toLanguageToolBar.barStyle = UIBarStyle.default
        toLanguageToolBar.isTranslucent = true
        toLanguageToolBar.tintColor = UIColor.black
        toLanguageToolBar.sizeToFit()
        
        let doneToLanguageButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(didTapToLanguageDone))
        
        toLanguageToolBar.setItems([ spaceButton, doneToLanguageButton], animated: false)
        toLanguageToolBar.isUserInteractionEnabled = true
        
        toLanguageTextField.inputAccessoryView = toLanguageToolBar
        
        view.addSubview(toLanguageTextField)
        
        NSLayoutConstraint.activate([
            
            fromLanguageTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            fromLanguageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            fromLanguageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            toLanguageTextField.topAnchor.constraint(equalTo: fromLanguageTextField.bottomAnchor, constant: 20),
            
            toLanguageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            toLanguageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
            
            ])
    }
    
    @objc private func didTapFromLanguageDone() {
        fromLanguageTextField.text = languageDataSource.selectedLanguage
        view.endEditing(true)
        presenter?.didSelectFromLanguage(identifier: languageDataSource.selectedLanguage)
    }
    
    @objc private func didTapToLanguageDone() {
        toLanguageTextField.text = languageDataSource.selectedLanguage
        view.endEditing(true)
        presenter?.didSelectToLanguage(identifier: languageDataSource.selectedLanguage)
    }
    
}


// MARK: - SourceLanguageViewInput
extension SourceLanguageViewController: SourceLanguageViewInput {
    
    func update(with model: [String], from: TranslateLanguages, to: TranslateLanguages) {
        languageDataSource.updateWith(model: model)
        fromLanguageTextField.text = from.rawValue
        toLanguageTextField.text = to.rawValue
        pickerView.reloadAllComponents()
    }
    
}

