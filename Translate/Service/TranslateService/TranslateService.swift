//
//  TranslateService.swift
//  Translate
//
//  Created by Evgen on 03/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import Foundation

final class TranslateService {
    
    private let networkClient: NetworkClient
    private var decoder: JSONDecoder
    
    init(networkClient: NetworkClient = NetworkClient(), decoder: JSONDecoder = JSONDecoder()) {
        self.networkClient = networkClient
        self.decoder = decoder
    }
    
    func translation(word: String, fromLang: String, toLang: String, success: @escaping (WordTranslation) -> Void, failure: @escaping (Error?) -> Void) {
        
        let url = URL(string: TranslateEndpoint.url + "?text=\(word)&key=\(TranslateEndpoint.key)&lang=\(fromLang)-\(toLang)")!
        
        networkClient.request(url: url) { result in
            
            switch result {
            case .success(let data):
                
                guard let data = data else {
                    failure(nil)
                    return
                }
                do {
                    let model = try self.decoder.decode(WordTranslation.self, from: data)
                    success(model)
                } catch {
                    failure(error)
                }
                
            case .failure(let error):
                failure(error)
 
            }
            
        }
        
    }
    
}
