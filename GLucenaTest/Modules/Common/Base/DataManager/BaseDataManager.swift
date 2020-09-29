//
//  BaseDataManager.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import Alamofire

class BaseDataManager {
    weak var callbackDelegate: BasePresenterCallbackProtocol?

    convenience init(delegate: BasePresenterCallbackProtocol?) {
        self.init()
        self.callbackDelegate = delegate
    }

    func handle<T>(result: Result<T>, completion: @escaping ((T) -> Void)) {
        do {
            try self.handle {
                let value = try result.unwrap()
                DispatchQueue.main.async {
                    completion(value)
                }
            }
        } catch {
            let result = "Error"
            self.callbackDelegate?.defaultError(result)
        }
    }

    func handleEmpty<T>(result: Result<T>, completion: @escaping (() -> Void)) {
        do {
            try self.handle {
                _ = try result.unwrap()
                DispatchQueue.main.async {
                    completion()
                }
            }
        } catch {
            let result = "Error"
            self.callbackDelegate?.defaultError(result)
        }
    }

    func handle(f: (() throws -> Void)) throws {
        do {
            try f()
        } catch ServerManagerError.noInternetError(let error) {
            print("No internet conection", error)
            self.callbackDelegate?.noInternetError(error)
        } catch ServerManagerError.defaultError(let error) {
            print("Default error", error)
            self.callbackDelegate?.defaultError(error)
        } catch let error {
            throw error
        }
    }

    deinit {
        print("deinit \(self)")
    }
}
