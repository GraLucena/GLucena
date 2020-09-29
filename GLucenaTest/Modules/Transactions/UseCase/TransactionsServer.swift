//
//  TransactionsServer.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import Alamofire

/// Define all server calls. If local needed create TransactionsLocalProtocol
protocol TransactionsServerProtocol {
    func getLatestTransactions(completion: @escaping (Alamofire.Result<[Transaction]>) -> Void)
}

final class TransactionsServer: BaseServerProtocol, TransactionsServerProtocol {
    var manager: NetworkManager = NetworkManager.defaultManager()

    func getLatestTransactions(completion: @escaping (Alamofire.Result<[Transaction]>) -> Void) {
        manager.getTransactions { response in
            self.handle(response: response, completion: completion)
        }
    }
}
