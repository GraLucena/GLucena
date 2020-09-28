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
}
