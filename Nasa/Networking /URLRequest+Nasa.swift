//
//  URLRequest+Nasa.swift
//  Nasa
//
//  Created by Angie Mugo on 21/11/2021.
//

import Foundation

extension URLRequest {
    init(_ endpoint: APIEndpoint, _ method: APIMethod = .get, _ parameters: [String: Any?]? = nil) {
        let baseURL = URL(string: "https://swapi.dev/")!
        let path = String(format: endpoint.rawValue)
        let urlString = "\(baseURL)\(path)"
        let url = URL(string: urlString)!
        self.init(url: url)
        httpMethod = method.rawValue
        processGetParameters(parameters)
    }

    private mutating func processGetParameters(_ parameters: [String: Any?]? = nil) {
        guard let parameters = parameters, !parameters.isEmpty else { return }
        let queryParameters = parameters.reduce("?") { (result, element) -> String in
            guard let value = element.value else { return result }
            guard value as? String != "" else { return result }
            if result.count > 1 {
                return "\(result)&\(element.key)=\(value)"
            }
            return "\(result)\(element.key)=\(value)"
        }
        var queryCharSet = NSCharacterSet.urlQueryAllowed
        queryCharSet.remove(charactersIn: "+")
        if let url = self.url?.absoluteString,
           let urlQueryParameters = queryParameters.addingPercentEncoding(withAllowedCharacters: queryCharSet) {
            let urlWithParameters = "\(url)\(urlQueryParameters)"
            self.url = URL(string: urlWithParameters)!
        }
    }

}
