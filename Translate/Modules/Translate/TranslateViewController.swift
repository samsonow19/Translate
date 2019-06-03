//
//  TranslateViewController.swift
//  Translate
//
//  Created by Evgen on 03/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import UIKit


// MARK: - View Protocol
protocol TranslateViewInput: AnyObject {
    func setup(transition: String)
}


// MARK: - TranslateView
final class TranslateViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: TranslateViewOutput?
    
    //private var viewModel: TranslateViewModel?
    private let inputText = UITextField()
    private let translationLabel = UILabel()
    private let translateButton = UIButton()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureInterface()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    // MARK: - UI
    
    private func configureInterface() {
        
        self.tabBarItem.title = "Перевод"
        inputText.translatesAutoresizingMaskIntoConstraints = false
        inputText.placeholder = "Введите слово"
        view.addSubview(inputText)
        
        translationLabel.translatesAutoresizingMaskIntoConstraints = false
        translationLabel.text = "Перевод слова"
        view.addSubview(translationLabel)
        
        translateButton.translatesAutoresizingMaskIntoConstraints = false
        translateButton.setTitle("Перевести", for: .normal)
        translateButton.setTitleColor(.black, for: .normal)
        translateButton.addTarget(self, action: #selector(didTapTranslateButton), for: .touchDown)
        view.addSubview(translateButton)
        
        NSLayoutConstraint.activate([
            
            inputText.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            inputText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            inputText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            translationLabel.topAnchor.constraint(equalTo: inputText.bottomAnchor, constant: 20),
            
            translationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            translationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            translateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            translateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            translateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
            
        ])
    }
    
    @objc private func didTapTranslateButton() {
        presenter?.didTaptranslateButton(with: inputText.text ?? "")
    }
    
}


// MARK: - TranslateViewInput
extension TranslateViewController: TranslateViewInput {

    func setup(transition: String) {
        translationLabel.text = transition
    }

}
