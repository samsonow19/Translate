//
//  NetworkClient.swift
//  Translate
//
//  Created by Evgen on 03/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import Foundation

protocol NetworkClient {
    func request<T: Decodable>(url: URL,
                               parrams: [String: String],
                               method: HttpMethod,
                               responseHandler: @escaping (Result<T, Error>) -> Void)
}


final class NetworkClientImp: NetworkClient {
    
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init(session: URLSession = URLSession.shared, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }

    func request<T: Decodable>(url: URL, parrams: [String: String], method: HttpMethod,
                 responseHandler: @escaping (Result<T, Error>) -> Void) {
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        let parrams: String = parrams.reduce("") { $0 + $1.key + "=" + $1.value }
        
        request.httpBody = parrams.data(using: .utf8)
        
        session.dataTask(with: request) { data, response, error in
            
            guard let resp = response as? HTTPURLResponse, (200...299 ~= resp.statusCode), let data = data else {
                
                let failureData = ServerError.serverError
                responseHandler(.failure(failureData))
                return
            }
            
            do {

                let model = try self.decoder.decode(T.self, from: data)
                responseHandler(.success(model))
            } catch {
                let failureData = ServerError.mapingError
                responseHandler(.failure(failureData))
            }
 
        }.resume()
    }
    
}
