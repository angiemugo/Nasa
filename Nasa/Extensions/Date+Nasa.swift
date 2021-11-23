//
//  Date+Nasa.swift
//  Nasa
//
//  Created by Angie Mugo on 23/11/2021.
//


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
        dateFormatter.dateFormat = "YY MMM, d"
        return dateFormatter.string(from: date)
    }
}
