//
//  TransactionsNetworkManager.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import Alamofire

protocol TransactionsNetworkManager: NetworkManagerProtocol {
    func getTransactions(completion: @escaping ((DataResponse<Any>)) -> Void)
}

extension NetworkManager: TransactionsNetworkManager {
    func getTransactions(completion: @escaping ((DataResponse<Any>)) -> Void) {
        secureRequest(TransactionTarget.transactions.request).validate().responseJSON { response in
            completion((response))
        }
    }
}
