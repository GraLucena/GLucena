//
//  TransactionBuilderTests.swift
//  GLucenaTestTests
//
//  Created by Graciela on 28/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

@testable import GLucenaTest
import Foundation
import XCTest

class TransactionBuilderTests: XCTestCase {
    var sut: TransactionsBuilder!

    override func setUp() {
        super.setUp()
        sut = TransactionsBuilder()
    }

    func testBuild() {
        let vc = sut.build() as? TransactionsViewController

        let presenter = vc?.presenter as? TransactionsPresenter<TransactionsViewController, TransactionsCoordinator>
        XCTAssertNotNil(vc)
        XCTAssertNotNil(presenter)
        XCTAssertNotNil(presenter?.coordinator)
        XCTAssertNotNil(presenter?.view)
    }
}
