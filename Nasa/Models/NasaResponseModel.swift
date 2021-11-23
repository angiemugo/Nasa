//
//  NasaResponseModel.swift
//  Nasa
//
//  Created by Angie Mugo on 21/11/2021.
//

import Foundation

struct SearchResponse: Codable {
    let collection: collectionResponse
}

struct collectionResponse: Codable {
    let items: [itemsResponse]
}

struct itemsResponse: Codable {
    let data: [dataResponse]
    let links: [linksResponse]

    func computeSubtitle(_ photographer: String, _ dateCreated: String) -> String {
        return "\(photographer) | \(dateCreated)"
    }

    func toListUIModel() -> UIModel {
        let dateString = Formatter.dateString(from: data.first?.dateCreated ?? Date())
        return UIModel(imageUrl: links.first?.href ?? "",
                       title: data.first?.title ?? "",
                       subtitle: computeSubtitle(data.first?.photographer ?? "",
                                                 dateString),
                       description: data.first?.description ?? "")
    }
}

struct dataResponse: Codable {
    let title: String
    let photographer: String?
    let dateCreated: Date
    let description: String
}

struct linksResponse: Codable {
    let href: String
}
