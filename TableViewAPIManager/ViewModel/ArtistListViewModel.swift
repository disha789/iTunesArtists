//
//  ArtistViewModel.swift
//  TableViewAPIManager
//
//  Created by Disha patel on 6/17/24.
//

import Foundation

class ArtistListViewModel {
    weak var delegate: ArtistListDataProtocol?
    internal var audiobooks: [Audiobook] = []

    func fetchData(_ searchTerm: String) {
        let searchUrl = Constants.serverUrl.rawValue + searchTerm.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        APIManager.shared.fetchData(url: searchUrl) { [weak self] (searchResult: AudiobookResponse?) in
            guard let searchResult = searchResult else {
                print("\(ServerErrors.noDataOrExtractionFailed.rawValue)")
                return
            }
            self?.audiobooks = searchResult.results
            self?.delegate?.didFetchArtistData(searchBarText: searchTerm)
        }
    }
    
    func getAudioCount() -> Int {
        return audiobooks.count
    }
    
    func getAudioFor(row: Int) -> Audiobook{
        return audiobooks[row]
    }
}
