//
//  RemoteDataSource.swift
//  Nasa
//
//  Created by Angie Mugo on 21/11/2021.
//

import RxSwift

final class RemoteDataSource: DataSource {
    var apiClient: APIClientProtocol

    init(_ apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }

    func fetchNasaImages() -> Single<SearchResponse> {
        let request = URLRequest(.search, .get, ["q": 22])
        return apiClient.request(request)
    }
}
