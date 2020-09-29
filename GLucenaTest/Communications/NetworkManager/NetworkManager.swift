//
//  NetworkManager.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import Alamofire
import Foundation

struct ServerRequest {
    let method: Alamofire.HTTPMethod
    let path: String
    let encoding: ParameterEncoding?
    let parameters: Parameters?
    var completeRequest: String {
        "\(Config.default.apiBaseUrl)\(path)"
    }

    init(method: Alamofire.HTTPMethod,
         path: String,
         parameters: Parameters? = nil,
         encoding: ParameterEncoding = JSONEncoding.default) {
        self.method = method
        self.path = path
        self.encoding = encoding
        self.parameters = parameters
    }
}

protocol NetworkManagerProtocol: AnyObject {
    func publicRequest(_ request: ServerRequest) -> DataRequest
    func secureRequest(_ request: ServerRequest) -> DataRequest
}

class NetworkManager: NetworkManagerProtocol {
    var baseURL: String!
    var manager: SessionManager

    private var defaultHeaders: HTTPHeaders

    init() {
        self.manager = Alamofire.SessionManager(configuration: URLSessionConfiguration.default)
        self.defaultHeaders = [:]
    }

    init(baseURL: String, headers: HTTPHeaders) {
        self.baseURL = baseURL
        self.defaultHeaders = headers

        manager = Alamofire.SessionManager(configuration: URLSessionConfiguration.default)
    }

    static func defaultManager() -> NetworkManager {
        let serverManager = NetworkManager(baseURL: Config.default.apiBaseUrl,
                                           headers: [:])
        return serverManager
    }

    // MARK: - Requests
    func publicRequest(_ request: ServerRequest) -> DataRequest {
        print("[REQUEST][URL] \(request.completeRequest):")
        if let params = request.parameters {
            print("[REQUEST][PARAMETERS] \(params as AnyObject)")
        }

        return manager.request(request.completeRequest,
                               method: request.method,
                               parameters: request.parameters,
                               encoding: request.encoding ?? JSONEncoding.default,
                               headers: nil)
    }

    func secureRequest(_ request: ServerRequest) -> DataRequest {
        print("[REQUEST][URL] \(request.completeRequest):")
        print("[REQUEST][PARAMETERS] \(request.parameters as AnyObject)")

        return manager.request(request.completeRequest,
                               method: request.method,
                               parameters: request.parameters,
                               encoding: request.encoding ?? JSONEncoding.default,
                               headers: nil)
    }
}
