//
//  APIClient.swift
//  Nasa
//
//  Created by Angie Mugo on 21/11/2021.
//

import Foundation
import RxSwift
import RxCocoa

public protocol APIClientProtocol {
    func request<T: Decodable>(_ urlRequest: URLRequest) -> Single<(T)>
}

final class APIClient: APIClientProtocol {
    func request<T: Decodable>(_ urlRequest: URLRequest) -> Single<(T)> {
        return Single.create(subscribe: { [unowned self] (observer) -> Disposable in
            return self.request(urlRequest, { (response) in
                observer(.success(response))
            }, { (error) in
                observer(.failure(error))
            })
        })
    }

    private func request<T: Decodable>(_ urlRequest: URLRequest,
                                       _ responseHandler: @escaping (T) -> Void,
                                       _ errorHandler: @escaping ((_ error: Error) -> Void)) -> Disposable {
        return URLSession
            .shared
            .rx
            .response(request: urlRequest)
            .asSingle()
            .timeout(RxTimeInterval.seconds(30),
                     scheduler: MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] (response) in
                guard let self = self else { return }
                let statusCode = response.response.statusCode
                if 200..<300 ~= statusCode {
                    do {
                    try self.decodeResponse(response.response, response.data, responseHandler)
                    } catch let error {
                        errorHandler(NasaErrors.NetworkError.DecodingFailure(errorMessage: error.localizedDescription))
                    }
                } else {
                    errorHandler(response.response.statusError)
                }
            }, onFailure: { _ in
                errorHandler(NasaErrors.timeout)
            })
    }

    private func decodeResponse<T: Decodable>(_ response: HTTPURLResponse,
                                              _ data: Data,
                                              _ responseHandler: @escaping (T) -> Void) throws {
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            responseHandler(try decoder.decode(T.self, from: data))
        } catch let error {
            throw(error)
        }
    }
}
