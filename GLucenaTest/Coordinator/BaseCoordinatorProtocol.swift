//
//  BaseCoordinatorProtocol.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import Foundation
import UIKit

protocol BaseCoordinatorProtocol: AnyObject {
    var viewController: UIViewController? { get }
    var openTransition: Transition? { get }

    func configure(openTransition: Transition?)
    func open(_ viewController: UIViewController, transition: Transition)
    func close(animated: Bool)

    //Common navigations, for all coordinators.
    func showAlert(with configuration: AlertConfiguration)
}

extension BaseCoordinatorProtocol {
    func close(animated: Bool = true) {
        close(animated: true)
    }
}
