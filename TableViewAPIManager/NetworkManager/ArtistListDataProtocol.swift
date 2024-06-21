//
//  ArtistListDataProtocol.swift
//  TableViewAPIManager
//
//  Created by Disha patel on 6/17/24.
//

import Foundation

protocol ArtistListDataProtocol: AnyObject {
    func didFetchArtistData(searchBarText: String)
}
