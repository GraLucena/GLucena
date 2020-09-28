//
//  BasePresenterProtocol.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import Foundation

protocol BasePresenterCallbackProtocol: AnyObject {
    func defaultError(_ error: String)
    func noInternetError(_ error: String)
}

protocol BasePresenterProtocol {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
}

extension BasePresenterProtocol {
    func viewDidLoad() {}
    func viewWillAppear() {}
    func viewDidAppear() {}
    func viewWillDisappear() {}
    func viewDidDisappear() {}
}
