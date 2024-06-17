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

    func fetchData() {
        APIManager.shared.fetchData(url: Constants.serverUrl.rawValue) { [weak self] (searchResult: AudiobookResponse?) in
            guard let searchResult = searchResult else {
                print("\(ServerErrors.noDataOrExtractionFailed.rawValue)")
                return
            }
            self?.audiobooks = searchResult.results
            self?.delegate?.didFetchArtistData()
        }
    }
    
    func getAudioCount() -> Int {
        return audiobooks.count
    }
    
    func getAudioFor(row: Int) -> Audiobook{
        return audiobooks[row]
    }
}
