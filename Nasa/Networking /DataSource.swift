//
//  DataSource.swift
//  Nasa
//
//  Created by Angie Mugo on 22/11/2021.
//

import RxSwift

protocol DataSource {
    var apiClient: APIClientProtocol { get }
    func fetchNasaImages() -> Single<SearchResponse> 
}
