//
//  BaseServerProtocol.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import Alamofire

protocol BaseServerProtocol {
    var manager: NetworkManager { get }

    func handle<T: Decodable>(response: DataResponse<Any>, completion: @escaping (Result<T>) -> Void)
}

extension BaseServerProtocol {
    func handle<T: Decodable>(response: DataResponse<Any>, completion: @escaping (Result<T>) -> Void) {
        switch response.result {
        case .success (let json):
            do {
                print(json)
                let data = try JSONSerialization.data(withJSONObject: json, options: [])
                let jsonDecoder = JSONDecoder()
                let result = try jsonDecoder.decode(T.self, from: data)
                completion(Result.success(result))
            } catch let error {
                print(error)
                completion(Result.failure(error))
            }
        case .failure (let error):
            print(error)
            if let parsedError = ServerManagerErrorHandler().validate(error: error, responseData: response.data) {
                completion(Result.failure(parsedError))
            } else {
                completion(Result.failure(error))
            }        }
    }
}
