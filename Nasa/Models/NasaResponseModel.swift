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

    func computeSubtitle(_ photographer: String, _ dateCreated: String) -> String {
        return "\(photographer) | \(dateCreated)"
    }

    func toListUIModel() -> UIModel {
        return UIModel(imageUrl: items.first?.links.first?.href ?? "",
                       title: items.first?.data.first?.title ?? "",
                       subtitle: computeSubtitle( items.first?.data.first?.photographer ?? "",
                                                  items.first?.data.first?.dateCreated ?? ""),
                       description:  items.first?.data.first?.description ?? "")
    }
}

struct itemsResponse: Codable {
    let data: [dataResponse]
    let links: [linksResponse]
}

struct dataResponse: Codable {
    let title: String
    let photographer: String
    let dateCreated: String
    let description: String
}

struct linksResponse: Codable {
    let href: String
}
