//
//  MockRemoteDataSource.swift
//  NasaTests
//
//  Created by Angie Mugo on 23/11/2021.
//

import RxSwift
@testable import Nasa

class MockRemoteDataSource: DataSource {
    let apiClient: APIClientProtocol

    init(_ apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }

    func fetchNasaImages() -> Single<SearchResponse> {
        let request = URLRequest(.search)
        return apiClient.request(request)
    }
}
