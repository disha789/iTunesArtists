//
//  Constants.swift
//  TableViewAPIManager
//
//  Created by Disha patel on 6/12/24.
//

import Foundation

enum Constants: String {
    case serverUrl = "https://itunes.apple.com/search?term="
}


enum ServerErrors: String {
    case invalidServerUrl = "Invalid server url"
    case unableConversionObject = "Unable to convert serialized object to audiobook model: "
    case fetchingDataError = "Encountered error while fetching data from server , please check it again"
    case noDataOrExtractionFailed = "Failed to fetch or extract data"
}

enum TableViewCellIdentifier : String {
    case artistCell = "ArtistTableViewCell"
}

