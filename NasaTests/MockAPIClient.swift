//
//  MockAPIClient.swift
//  NasaTests
//
//  Created by Angie Mugo on 23/11/2021.
//

import Foundation
@testable import Nasa
import RxSwift

class MockAPIClient: APIClientProtocol {
    private let localDataSource = JsonLocalDataSource()
    private let error: NasaErrors = .timeout
    private let disposeBag = DisposeBag()
    var fetchSuccess = false

    private func getResponse() -> Single<SearchResponse> {
        return localDataSource.read("Items")
    }

    func request<T>(_ urlRequest: URLRequest) -> Single<(T)> where T : Decodable {
        return Single.create { single -> Disposable in
            if self.fetchSuccess {
                self.getResponse().subscribe(onSuccess: { item in
                    single(.success(item as! T))
                }, onFailure: { error in
                    single(.failure(error))
                }).disposed(by: self.disposeBag)
                return Disposables.create()
            } else {
                single(.failure(self.error))
                return Disposables.create()
            }
        }
    }
}
