//
//  AlertPresenter.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import Foundation

protocol AlertPresenterProtocol: BasePresenterProtocol {
    func didTapButton(_ action: ActionType)
}

class AlertPresenter {
    weak var view: AlertViewProtocol?
    let coordinator: AlertCoordinatorProtocol

    var configuration: AlertConfiguration!

    required init(coordinator: BaseCoordinatorProtocol) {
        self.coordinator = coordinator as! AlertCoordinator
    }

    convenience init(coordinator: BaseCoordinatorProtocol, configuration: AlertConfiguration) {
        self.init(coordinator: coordinator)
        self.configuration = configuration
    }
}

extension AlertPresenter: AlertPresenterProtocol {
    func viewDidLoad() {
        view?.configureView(title: configuration.title, description: configuration.description)
        view?.configureButtons(okButtonTitle: configuration.okButton, koButtonTitle: configuration.koButton)
    }

    func viewWillAppear() {
        view?.applyBackgroundColor()
        view?.hideNavigationBar()
    }

    func didTapButton(_ action: ActionType) {
        coordinator.close()
        configuration.delegate?.didTapButton(action, alertIdentifier: configuration.alertIdentifier)
    }
}
