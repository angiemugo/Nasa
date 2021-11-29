//
//  Date+Nasa.swift
//  Nasa
//
//  Created by Angie Mugo on 23/11/2021.
//


import Foundation

extension Date {
    func dateString()-> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM, YYYY"
        return dateFormatter.string(from: self)
    }
}
