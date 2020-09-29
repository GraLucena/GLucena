//
//  TransactionsUseCase.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

protocol TransactionsUseCaseProtocol {
    func getLatestTrasactions(completion: (([Transaction]) -> Void)?)
}

class TransactionsUseCase: BaseDataManager {
    var server: TransactionsServer! = TransactionsServer()
}

extension TransactionsUseCase: TransactionsUseCaseProtocol {
    func getLatestTrasactions(completion: (([Transaction]) -> Void)?) {
        server.getLatestTransactions { result in
            do {
                try self.handle {
                    let transactions = try result.unwrap()
                    completion?(self.filter(self.uniques(transactions)))
                }
            } catch {
                let result = "Global.error.messsage"
                self.callbackDelegate?.defaultError(result)
            }
        }
    }
    
    private func filter(_ transactions: [Transaction]) -> [Transaction] {
        return transactions.filter {
            $0.date != nil /// Select only parseable dates.
        }.sorted { first, second -> Bool in
            first < second /// Order by date
        }
    }
    
    /// Filter uniques elements by id, and select the most recent transaction.
    private func uniques(_ transactions: [Transaction]) -> [Transaction] {
        var alreadyThere = Set<Transaction>()
        let uniquePosts = transactions.compactMap { transaction -> Transaction? in
            guard !alreadyThere.contains(where: { $0 == transaction && !($0 < transaction) }) else { return nil }
            alreadyThere.insert(transaction)
            return transaction
        }

        return uniquePosts
    }
}
