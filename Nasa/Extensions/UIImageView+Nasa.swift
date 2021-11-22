//
//  UIImageView+Nasa.swift
//  Nasa
//
//  Created by Angie Mugo on 22/11/2021.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(_ url: URL) {
        self.kf.setImage(with: url) 
    }
}

import Foundation

extension Formatter {
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
        return formatter
    }()

    static func dateString(from date: Date)-> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY, MMM d"
        return dateFormatter.string(from: date)
    }
}
