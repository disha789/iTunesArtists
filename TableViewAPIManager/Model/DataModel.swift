//
//  APIManager.swift
//  TableViewAPIManager
//
//  Created by Disha patel on 6/12/24.
//
import UIKit

struct AudiobookResponse: Codable {
    let resultCount: Int?
    let results: [Audiobook]
}

struct Audiobook: Codable {
    let artistName: String?
    let country: String?
    let primaryGenreName: String?
    let collectionPrice: Double?
    let artworkUrl60: String?
}



