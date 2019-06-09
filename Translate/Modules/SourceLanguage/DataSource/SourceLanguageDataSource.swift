//
//  SourceLanguageDataSource.swift
//  Translate
//
//  Created by Evgen on 09/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import UIKit

protocol SourceLanguageDataSourceOutpute: AnyObject {
    var selectedLanguage: String { get }
}

final class SourceLanguageDataSource: NSObject {
    
    private var modelsPikerView: [String] = []
    private var delegate: SourceLanguageDataSourceOutpute?
    private var selectedIndex: Int = 0
    
    var selectedLanguage: String {
        return modelsPikerView[selectedIndex]
    }
    
    func updateWith(model: [String]) {
        self.modelsPikerView = model
    }
    
}


// MARK: - UIPickerViewDelegate
extension SourceLanguageDataSource: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return modelsPikerView.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return modelsPikerView[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedIndex = row
    }
    
}
