//
//  TransactionTarget.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import Alamofire

enum TransactionTarget {
    case transactions
}

extension TransactionTarget {
    var request: ServerRequest {
        switch self {
        case .transactions:
            return ServerRequest(method: .get, path: "/transactions.json")
        }
    }
}
