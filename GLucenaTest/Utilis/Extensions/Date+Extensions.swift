//
//  Date+Extensions.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import Foundation

extension Date {
    /// Creates a `Date` from the given string and formatter. Nil if the string couldn't be parsed
    init?(string: String, formatter: DateFormatter) {
        guard let date = formatter.date(from: string) else { return nil }
        self.init(timeIntervalSince1970: date.timeIntervalSince1970)
    }

    /// Prints a string representation for the date with the given formatter
    func string(with format: DateFormatter) -> String {
        format.string(from: self)
    }
}
