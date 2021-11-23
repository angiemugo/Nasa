//
//  NasaErrors.swift
//  Nasa
//
//  Created by Angie Mugo on 21/11/2021.
//

import Foundation

public enum NasaErrors: Error {
    case success
    case created
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case conflict
    case serverError
    case other
    case timeout

    public enum NetworkError: Error {
        case DecodingFailure(errorMessage: String)
        case BadRequest(errorMessage: String)
        case Unauthorized
        case NotFound(errorMessage: String)
        case other

        init(response: HTTPURLResponse, message: String) {
            switch response.statusError {
            case .badRequest:
                self = .BadRequest(errorMessage: message)
            case .notFound:
                self = .BadRequest(errorMessage: message)
            case .unauthorized:
                self = .Unauthorized
            default:
                self = .other
            }
        }

        func errorMessage()-> String {
            switch self {
            case .BadRequest(let message):
                return message
            case .NotFound(let message):
                return message
            case .DecodingFailure(let message):
                return message
            case .Unauthorized:
                return "Unauthorized"
            default:
                return "Something Went Wrong!"
            }
        }
    }
}

