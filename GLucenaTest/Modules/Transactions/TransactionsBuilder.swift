//
//  TransactionsBuilder.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import Foundation
import UIKit

/// Factory to create controller, presenter and coordinator. Set the whole module.
final class TransactionsBuilder: BaseBuilderProtocol {
    var openTransition: Transition?

    init() {}

    func build() -> UIViewController {
        let coordinator = TransactionsCoordinator()
        coordinator.configure(openTransition: openTransition)

        let viewController = TransactionsViewController(nibName: "TransactionsViewController", bundle: nil)
        let presenter = TransactionsPresenter(coordinator: coordinator, view: viewController)
        viewController.presenter = presenter
        coordinator.viewController = viewController
        return viewController
    }
}
