//
//  URLResponse+Nasa.swift
//  Nasa
//
//  Created by Angie Mugo on 23/11/2021.
//

import Foundation

extension HTTPURLResponse {
    var statusError: NasaErrors {
        switch self.statusCode {
        case 200...299:
            return .success
        case 400:
            return .badRequest
        case 401:
            return .unauthorized
        case 403:
            return .forbidden
        case 404:
            return .notFound
        case 409:
            return .conflict
        case 500...599:
            return .serverError
        default:
            return .other
        }
    }
}

