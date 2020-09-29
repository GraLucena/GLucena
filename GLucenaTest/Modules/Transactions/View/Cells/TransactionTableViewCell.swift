//
//  TransactionTableViewCell.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    // -------------------------------------
    // MARK: Section - IBOutlets
    // -------------------------------------
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var feeLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!

    // -------------------------------------
    // MARK: Section - Other Methods
    // -------------------------------------
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    // -------------------------------------
    // MARK: Section - Other Methods
    // -------------------------------------
    func bindWith(_ transaction: Transaction) {
        descriptionLabel.text = "\(transaction.id) - \(transaction.description?.isEmpty ?? true ? "No Description..." : transaction.description ?? "")"
        dateLabel.text = transaction.date?.string(with: .transactionDate)
        totalLabel.textColor = transaction.type.color
        
        amountLabel.text = "Ammount: \(Formatter.currencyWithDecimal.string(for: transaction.amount) ?? "-")"
        feeLabel.text = "Fee: \(Formatter.currencyWithDecimal.string(for: transaction.fee ?? 0.0) ?? "")"
        totalLabel.text = Formatter.currencyWithDecimal.string(for: transaction.total) ?? ""
    }
}
