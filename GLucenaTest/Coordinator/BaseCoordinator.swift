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

    deinit {
        print("deinit ", self)
    }
}

//extension MO2ORouter: CustomAlertRoute {
//    func showAlert(with configuration: CustomAlert) {
//        openAlert(configuration: configuration)
//    }
//}
