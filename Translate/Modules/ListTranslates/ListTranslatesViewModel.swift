//
//  ViewModel.swift
//  Translate
//
//  Created by Evgen on 08/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import CoreGraphics

// MARK: - View Model
struct ListTranslatesViewModel {
    let rows: [ListTranslatesRow]
}


// MARK: - Model Row
struct ListTranslatesRow {
    
    let type: CellType
    let height: CGFloat
}

extension ListTranslatesRow {
    
    enum CellType {
        
        case translate(ListTranslateCell.Model)
        
        var identifier: String {
            
            switch self {
                
            case .translate:
                return String(describing: ListTranslateCell.self)
  
            }
        }
        
        var setupObject: ListTranslateCell.Model {
            
            switch self {
                
            case .translate(let model):
                return model
                
            }
        }
        
    }
    
}
