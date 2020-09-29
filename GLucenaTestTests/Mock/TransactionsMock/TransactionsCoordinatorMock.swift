//
//  TransactionsCoordinatorMock.swift
//  GLucenaTestTests
//
//  Created by Graciela on 28/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

@testable import GLucenaTest
import Foundation
import UIKit

class TransactionsCoordinatorMock: TransactionsCoordinatorProtocol {
    var viewController: UIViewController?
    var openTransition: Transition?
    var isAlertShow: Bool = false

    func configure(openTransition: Transition?) {}
    
    func open(_ viewController: UIViewController, transition: Transition) {}
    
    func showAlert(with configuration: AlertConfiguration) {
        isAlertShow = true
    }
}
