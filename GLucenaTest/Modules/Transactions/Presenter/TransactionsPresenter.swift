//
//  TransactionsPresenter.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import Foundation

protocol TransactionsPresenterProtocol: BasePresenterProtocol {
    func numberOfTransactions() -> Int
    func getTransactionAt(_ index: Int) -> Transaction
    func getLastestTransaction() -> Transaction?
}

class TransactionsPresenter<V: TransactionsViewProtocol, C: TransactionsCoordinatorProtocol>: BasePresenter<V, C> {
    // -------------------------------------
    // MARK: Section - Properties
    // -------------------------------------
    var dataManager: TransactionsUseCaseProtocol!
    var transactions = [Transaction]() {
        didSet {
            view?.reloadData() /// Reload Table view when data is available
        }
    }

    // -------------------------------------
    // MARK: Section - Initializers
    // -------------------------------------
    required init(coordinator: C, view: V) {
        super.init(coordinator: coordinator, view: view)
        dataManager = TransactionsUseCase(delegate: self)
    }
}

extension TransactionsPresenter: TransactionsPresenterProtocol {
    // -------------------------------------
    // MARK: Section - View Life-Cycle Methods
    // -------------------------------------
    func viewDidLoad() {
        getLatestTransactions()
    }

    // -------------------------------------
    // MARK: Section - Private Methods
    // -------------------------------------
    private func getLatestTransactions() {
        view?.showLoading()
        dataManager.getLatestTrasactions { [unowned self] transactions in
            self.view?.hideLoading()
            self.transactions = transactions
        }
    }
    
    // -------------------------------------
    // MARK: Section - Public Methods
    // -------------------------------------
    func numberOfTransactions() -> Int {
        transactions.count - 1 ///  -1 To avoid show the most recent transaction, pinned at top.
    }
    
    func getTransactionAt(_ index: Int) -> Transaction {
        transactions[index]
    }

    func getLastestTransaction() -> Transaction? {
        if transactions.isEmpty { return nil }
        return transactions.reduce(transactions[0], { $0 < $1 ? $1 : $0 } )
    }
}
