//
//  AlertRoute.swift
//  GLucenaTest
//
//  Created by Graciela on 28/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import Foundation

protocol AlertRoute {
    func openAlert(configuration: AlertConfiguration)
}

extension AlertRoute where Self: BaseCoordinatorProtocol {
    func openAlert(configuration: AlertConfiguration) {
        let transition = ModalTransition()
        transition.modalTransitionStyle = .crossDissolve

        let builder = AlertBuilder(configuration: configuration)
        builder.openTransition = transition

        let targetViewController = builder.build()

        open(targetViewController, transition: transition)
    }
}
