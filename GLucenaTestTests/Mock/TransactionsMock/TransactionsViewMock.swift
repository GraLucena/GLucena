//
//  TransactionsViewMock.swift
//  GLucenaTestTests
//
//  Created by Graciela on 28/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

@testable import GLucenaTest
import Foundation

class TransactionsViewMock: TransactionsViewProtocol {
    var dataReloaded: Bool = false
    var viewLoaded: Bool = false
    var showingLoading: Bool = false
    var hiddenLoading: Bool = false

    func showLoading() {
        showingLoading = true
    }
    
    func hideLoading() {
        hiddenLoading = true
    }
    
    func viewDidLoad() {
        viewLoaded = true
    }

    func reloadData() {
        dataReloaded = true
    }
}
