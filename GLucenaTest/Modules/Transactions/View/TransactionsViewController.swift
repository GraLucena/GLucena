//
//  TransactionsViewController.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import UIKit

protocol TransactionsViewProtocol: BaseViewProtocol {
    func reloadData()
}

class TransactionsViewController: BaseViewController {
    // -------------------------------------
    // MARK: Section - Properties
    // -------------------------------------
    var presenter: TransactionsPresenterProtocol!

    // -------------------------------------
    // MARK: Section - IBOutlets
    // -------------------------------------
    @IBOutlet weak var tableView: UITableView!

    // -------------------------------------
    // MARK: Section - View Life-Cycle Methods
    // -------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupTableView()
    }

    // -------------------------------------
    // MARK: Section - Private Methods
    // -------------------------------------
    private func setupTableView() {
        tableView.register(UINib(nibName: "TransactionTableViewCell", bundle: nil), forCellReuseIdentifier: "TransactionTableViewCell")
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
    }
}

// MARK: Extension - TransactionsViewProtocol
extension TransactionsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfTransactions()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionTableViewCell", for: indexPath) as? TransactionTableViewCell {
            cell.bindWith(presenter.getTransactionAt(indexPath.row))
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = Bundle.main.loadNibNamed("TransactionTableViewCell", owner: self, options: nil)?[0] as! TransactionTableViewCell
        guard let latest = presenter.getLastestTransaction() else
        {
            return UIView()
        }
        
        cell.bindWith(latest)
        cell.contentView.backgroundColor = .lightGray
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
}

// MARK: Extension - TransactionsViewProtocol
extension TransactionsViewController: TransactionsViewProtocol {
    func reloadData() {
        tableView.reloadData()
    }
}
