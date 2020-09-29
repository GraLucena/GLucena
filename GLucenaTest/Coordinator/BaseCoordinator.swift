//
//  BaseCoordinator.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import Foundation
import UIKit

class BaseCoordinator: BaseCoordinatorProtocol {
    weak var viewController: UIViewController?
    var openTransition: Transition?

    func configure(openTransition: Transition?) {
        self.openTransition = openTransition
    }

    func open(_ viewController: UIViewController, transition: Transition) {
        transition.sourceViewController = self.viewController
        transition.open(viewController)
    }

    func close(animated: Bool = true) {
        guard let transition = openTransition else {
            assertionFailure("Open transition is not set. Use configure(openTransition:) in the route set up.")
            return
        }
        guard let viewController = viewController else {
            assertionFailure("Origin view controller is not set.")
            return
        }
        transition.close(viewController, animated: animated)
    }

    deinit {
        print("deinit ", self)
    }
}

extension BaseCoordinator: AlertRoute {
    func showAlert(with configuration: AlertConfiguration) {
        openAlert(configuration: configuration)
    }
}
