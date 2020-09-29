//
//  TransactionsPresenterTests.swift
//  GLucenaTestTests
//
//  Created by Graciela on 28/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

@testable import GLucenaTest
import Foundation
import XCTest

class TransactionsPresenterTests: XCTestCase {
    var sut: TransactionsPresenter<TransactionsViewMock, TransactionsCoordinatorMock>!
    var view: TransactionsViewMock!
    var coordinator: TransactionsCoordinatorMock!

    override func setUp() {
        super.setUp()
        view = TransactionsViewMock()
        coordinator = TransactionsCoordinatorMock()
        sut = TransactionsPresenter(coordinator: coordinator, view: view)
    }
    
    func testDataLoaded() {
        sut.viewDidLoad()
        XCTAssertTrue(view.showingLoading)
        let exp = expectation(description: "Test after 5 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 5.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(view.dataReloaded)
            XCTAssertTrue(view.hiddenLoading)
        } else {
            XCTFail("Delay interrupted")
        }
    }
}
