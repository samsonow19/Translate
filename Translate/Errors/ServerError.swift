//
//  ServerError.swift
//  Translate
//
//  Created by Evgen on 03/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import Foundation

enum ServerError: Error {
    case statusCode
    case serverError
    case mapingError
    case urlError
}


enum DataBaseError: Error {
    case notSave
    case notFoundWord
    case noRemove
}
