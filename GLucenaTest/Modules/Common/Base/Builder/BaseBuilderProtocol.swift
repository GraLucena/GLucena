//
//  BaseBuilderProtocol.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import Foundation
import UIKit

protocol BaseBuilderProtocol {
    var openTransition: Transition? { get set }

    func build() -> UIViewController
}
