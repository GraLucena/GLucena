//
//  ServerManagerError.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import Alamofire

struct ServerManagerErrorHandler {
    func validate(error: Error?, responseData: Data?) -> ServerManagerError? {
        if let err = error as? URLError {
            return handle(err)
        } else {
            return nil
        }
    }

    // MARK: - App
    private func handle(_ error: URLError) -> ServerManagerError {
        switch error.code {
        case .notConnectedToInternet:
            print(error.code, ": notConnectedToInternet")
            return makeNoInternetError(error)
        case .networkConnectionLost:
            print(error.code, ": networkConnectionLost")
            return makeNoInternetError(error)
        default:
            print(error.code, ": defaultError ", error)
            return makeDefaultError(error)
        }
    }

    /*
     *    Return:
     *        noInternetError
     */
    private func makeNoInternetError(_ error: URLError?) -> ServerManagerError {
        let result = "Connection Error"
        return ServerManagerError.noInternetError(result)
    }

    /*
     *    Return:
     *        defaultError
     */
    private func makeDefaultError(_ error: URLError?) -> ServerManagerError {
        let result = "Error"
        return ServerManagerError.defaultError(result)
    }
}

enum ServerManagerError: Error {
    case noInternetError(String)
    case defaultError(String)
    
    /// We can handle client and server errors. Example: token expired, and set the callback delegate to do some stuff
}
