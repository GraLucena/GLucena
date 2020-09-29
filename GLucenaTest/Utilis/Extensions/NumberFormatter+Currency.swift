//
//  NumberFormatter+Currency.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import Foundation

extension NumberFormatter {
    convenience init(numberStyle: Style) {
        self.init()
        self.numberStyle = numberStyle
        currencyCode = "EUR"
    }
}

extension Formatter {
    static let currencyWithDecimal: NumberFormatter = {
        let formatter = NumberFormatter(numberStyle: .currency)
        formatter.locale = Locale(identifier: "es_ES")
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
}
