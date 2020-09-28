//
//  TransactionsUseCase.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import Alamofire

protocol TransactionsUseCaseProtocol {
    func getLatestTransactions(completion: @escaping (Alamofire.Result<[Transaction]>) -> Void)
}

final class TransactionsUseCase: BaseServerProtocol, TransactionsUseCaseProtocol {
    var manager: NetworkManager = NetworkManager.defaultManager()

    func getLatestTransactions(completion: @escaping (Alamofire.Result<[Transaction]>) -> Void) {
        manager.getTransactions { response in
            self.handle(response: response, completion: completion)
        }
    }
}
