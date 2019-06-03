//
//  NetworkClient.swift
//  Translate
//
//  Created by Evgen on 03/06/2019.
//  Copyright © 2019 Evgen. All rights reserved.
//

import Foundation

final class NetworkClient {
    
    var session = URLSession.shared
    
    func request(request: URLRequest,
                 responseHandler: @escaping (Result<Data?, Error>) -> Void) {

        session.dataTask(with: request) { data, response, error in
            guard let resp = response as? HTTPURLResponse, (200...299 ~= resp.statusCode) else {
                let failureData = ServerError.statusCode
                responseHandler(.failure(failureData))
                return
            }

            responseHandler(.success(data!))
            }.resume()
    }
    
}
