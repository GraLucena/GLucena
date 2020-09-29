//
//  TransactionTests.swift
//  GLucenaTestTests
//
//  Created by Graciela on 28/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

@testable import GLucenaTest
import XCTest

class TransactionTests: XCTestCase {
    var transaction: Transaction!

    override func setUp() {
        super.setUp()
        let json = """
                    {
                        "id": 4734,
                        "date": "2018-07-11T22:49:24.000Z",
                        "amount": -193.38,
                        "fee": -3.18,
                        "description": "Lorem ipsum dolor sit amet"
                    }
        """
        
        let jsonData = json.data(using: .utf8)!
        transaction = try! JSONDecoder().decode(Transaction.self, from: jsonData)
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testModel() {
        XCTAssertEqual(transaction.id, 4734)
        XCTAssertEqual(transaction.date, Date(string: "2018-07-11T22:49:24.000Z", formatter: .fullDate))
        XCTAssertEqual(transaction.amount, -193.38)
        XCTAssertEqual(transaction.fee, -3.18)
        XCTAssertEqual(transaction.description, "Lorem ipsum dolor sit amet")
    }
    
    func testTotal() {
        XCTAssertEqual(transaction.total, (transaction.amount ?? 0) + (transaction.fee ?? 0))
    }
    
    func testOutcome() {
        XCTAssertEqual(transaction.type, TransactionType.outcome)
    }

}
