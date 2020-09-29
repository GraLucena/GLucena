//
//  AlertBuilder.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import UIKit

struct AlertConfiguration {
    var title: String?
    var description: String?
    var okButton: String?
    var koButton: String?
    var alertIdentifier: String?
    weak var delegate: AlertDelegate?

    init(title: String? = nil, description: String? = nil, okButton: String? = nil, koButton: String? = nil, identifier: String? = nil, delegate: AlertDelegate? = nil) {
        self.title = title
        self.description = description
        self.okButton = okButton
        self.koButton = koButton
        self.alertIdentifier = identifier
        self.delegate = delegate
    }
}

protocol AlertDelegate: AnyObject {
    func didTapButton(_ action: ActionType, alertIdentifier: String?)
}

class AlertBuilder: BaseBuilderProtocol {
    var openTransition: Transition?
    var configuration: AlertConfiguration

    init(configuration: AlertConfiguration) {
        self.configuration = configuration
    }

    func build() -> UIViewController {
        let coordinator = AlertCoordinator()
        coordinator.configure(openTransition: openTransition)

        let presenter = AlertPresenter(coordinator: coordinator, configuration: configuration)

        let viewController = AlertViewController(nibName: "AlertViewController", bundle: nil)
        let navigationController = UINavigationController.init(rootViewController: viewController)

        viewController.presenter = presenter
        presenter.view = viewController
        coordinator.viewController = viewController

        return navigationController
    }
}
