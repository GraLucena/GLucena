//
//  TransactionServerTests.swift
//  GLucenaTestTests
//
//  Created by Graciela on 28/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import Alamofire
@testable import GLucenaTest
import Foundation
import XCTest
import Mocker

class LoginServerTests: XCTestCase {
    var sut: TransactionsServer! = TransactionsServer()

    override func setUp() {
        super.setUp()
        sut.manager = mockNetworkManager()
    }

    override func tearDown() {
        super.tearDown()
        Mocker.removeAll()
    }

    func testGetTransactions() {
        let expectation = self.expectation(description: "Transaction Request Success")
        var success: Bool = false
        mockRequest()
        sut.getLatestTransactions { transactions in
            expectation.fulfill()
            success = true
        }

        waitForExpectations(timeout: 50, handler: nil)
        XCTAssertTrue(success)
    }

    private func mockRequest() {
        let urlToMock = "\(Config.default.apiBaseUrl)/transactions.json"
        let mockedData = mockedDataFromJson("Transactions")!

        let mock = Mock(url: URL(string: urlToMock)!, dataType: .json, statusCode: 200, data: [
            .get: mockedData])
        mock.register()
    }
}
