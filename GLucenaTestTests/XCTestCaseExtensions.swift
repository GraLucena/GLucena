//
//  XCTestCaseExtensions.swift
//  GLucenaTestTests
//
//  Created by Graciela on 28/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

@testable import GLucenaTest
import Foundation
import XCTest

extension XCTestCase {
    func getModelFromJson<T>(_ resource: String) -> T where T: Codable {
        let url = Bundle(for: type(of: self)).url(forResource: resource, withExtension: "json")
        let data = try? Data(contentsOf: url!)
        let jsonDecoder = JSONDecoder()
        return try! jsonDecoder.decode(T.self, from: data!)
    }

    func mockedDataFromJson(_ resource: String) -> Data? {
        let url = Bundle(for: type(of: self)).url(forResource: resource, withExtension: "json")
        return try? Data(contentsOf: url!)
    }

    func mockNetworkManager() -> NetworkManager {
        let networkManager = NetworkManager(baseURL: Config.default.apiBaseUrl,
                                            headers: [:])

        return networkManager
    }
}

