//
//  Translation.swift
//  Translate
//
//  Created by Evgen on 03/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import Foundation

struct WordTranslation: Decodable {
    let code: Int
    let lang: String
    let text: [String]
}
