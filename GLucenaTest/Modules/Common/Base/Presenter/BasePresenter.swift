//
//  BasePresenter.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import Foundation

class BasePresenter<V: BaseViewProtocol, C: BaseCoordinatorProtocol>: BasePresenterCallbackProtocol {
    weak var view: V?
    var coordinator: C!

    required init(coordinator: C, view: V) {
        self.coordinator = coordinator
        self.view = view
    }

    func defaultError(_ error: String) {
        DispatchQueue.main.async {
            self.view?.hideLoading()
//            let customAlert = CustomAlert(title: "Global.error".locale(), description: error, okButton: "Global.accept".locale())
//            self.router.showAlert(with: customAlert)
        }
    }

    func noInternetError(_ error: String) {
        DispatchQueue.main.async {
            self.view?.hideLoading()
//            let customAlert = CustomAlert(title: "Global.error".locale(), description: error, okButton: "Global.accept".locale())
//            self.router.showAlert(with: customAlert)
        }
    }
}
