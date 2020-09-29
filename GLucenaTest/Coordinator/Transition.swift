//
//  Transition.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import Foundation
import UIKit

protocol Transition: AnyObject {
    var sourceViewController: UIViewController? { get set }
    var completionHandler: (() -> Void)? { get set }

    func open(_ viewController: UIViewController)
    func close(_ viewController: UIViewController, animated: Bool)
}

extension Transition {
    func close(_ viewController: UIViewController, animated: Bool = true) {
        viewController.dismiss(animated: true, completion: nil)
    }
}
