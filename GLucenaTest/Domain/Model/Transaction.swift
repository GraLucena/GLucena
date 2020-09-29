//
//  Transaction.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

//{
//    "id": 4734,
//    "date": "2018-07-11T22:49:24.000Z",
//    "amount": -193.38,
//    "fee": -3.18,
//    "description": "Lorem ipsum dolor sit amet"
//}

import Foundation
import UIKit

/// Type to make diference on setting cell.
enum TransactionType {
    case income
    case outcome
    
    var color: UIColor {
        switch self {
        case .income:
            return .incomeGreen
        case .outcome:
            return .outcomeRed
        }
    }
}

struct Transaction: Codable, Comparable, Hashable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case date
        case amount
        case fee
        case description
    }

    let id: Int
    let date: Date?
    let amount: Double?
    let fee: Double?
    let description: String?
    var total: Double? {
        (amount ?? 0) + (fee ?? 0)
    }
    var type: TransactionType {
        return total?.isLess(than: 0.0) ?? false ? .outcome : .income
    }

    static func < (lhs: Transaction, rhs: Transaction) -> Bool {
        guard let _ = lhs.date, let _ = rhs.date else {
            return false
        }
        return lhs.date! < rhs.date!
    }

    static func == (lhs: Transaction, rhs: Transaction) -> Bool {
        lhs.id == rhs.id
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)

        let dateString = try values.decode(String.self, forKey: .date)
        date = Date(string: dateString, formatter: .fullDate)

        amount = try values.decodeIfPresent(Double.self, forKey: .amount)
        fee = try values.decodeIfPresent(Double.self, forKey: .fee)
        description = try values.decodeIfPresent(String.self, forKey: .description)
    }
}
