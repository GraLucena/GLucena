//
//  BaseViewProtocol.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import Foundation
import SVProgressHUD

protocol BaseViewProtocol: AnyObject {
    func showLoading()
    func hideLoading()
    
    // Comment:
}

extension UIViewController: BaseViewProtocol {
    func showLoading() {
        let mask: SVProgressHUDMaskType = .clear
        SVProgressHUD.setDefaultMaskType(mask)
        SVProgressHUD.show()
    }

    func hideLoading() {
        SVProgressHUD.dismiss()
    }
}
