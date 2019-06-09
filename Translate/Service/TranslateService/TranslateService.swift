//
//  TranslateService.swift
//  Translate
//
//  Created by Evgen on 03/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import Foundation

protocol TranslateService {
    func translation(word: String, fromLang: String, toLang: String, success: @escaping (WordTranslation) -> Void, failure: @escaping (Error?) -> Void)
}

final class TranslateServiceImp: TranslateService {
    
    private let networkClient: NetworkClient
    typealias TranslateResult = Result<WordTranslation, Error>
    
    init(networkClient: NetworkClient = NetworkClientImp()) {
        self.networkClient = networkClient
    }
    
    func translation(word: String, fromLang: String, toLang: String, success: @escaping (WordTranslation) -> Void, failure: @escaping (Error?) -> Void) {
        
        let stringUrl = TranslateEndpoint.url+"?key=\(TranslateEndpoint.key)&lang=\(fromLang)-\(toLang)"
        
        guard let url = URL(string: stringUrl) else {
            failure(ServerError.urlError)
            return
        }
        
        let parrams: [String: String] = ["text": word]
        
        networkClient.request(url: url, parrams: parrams, method: .post) { (result: TranslateResult) in
            
            switch result {
                
            case .success(let model):
                success(model)
                
            case .failure(let error):
                failure(error)
            }
            
            
        }
        
    }
    
}
