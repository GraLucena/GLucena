//
//  Config.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import Foundation

/// Variables for diferents enviroments, User - Define on build settings.
struct Config: Decodable {
    private enum CodingKeys: String, CodingKey {
        case apiBaseUrl = "API_BASE_URL"
    }

    let apiBaseUrl: String
}

// -------------------------------------
// MARK: Section - Static properties
// -------------------------------------
extension Config {
    static let `default`: Config = {
        guard let propertyList = Bundle.main.infoDictionary else {
            fatalError("Unable to get property list.")
        }

        guard let data = try? JSONSerialization.data(withJSONObject: propertyList, options: []) else {
            fatalError("Unable to instantiate data from property list.")
        }

        let decoder = JSONDecoder()

        guard let configuration = try? decoder.decode(Config.self, from: data) else {
            fatalError("Unable to decode the Environment configuration file.")
        }

        return configuration
    }()
}
