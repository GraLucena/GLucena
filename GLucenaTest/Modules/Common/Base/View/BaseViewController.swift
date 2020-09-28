//
//  BaseViewController.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .default
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        localizeStrings()
        accesibilityIdentifiers()
        applyStyles()
    }

    //Override these functions to get called in child view controllers
    @objc
    public func localizeStrings() {}

    @objc
    public func accesibilityIdentifiers() {}

    @objc
    public func applyStyles() {}
}
