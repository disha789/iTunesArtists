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
    var apiManager: APIManager

    init(apiManager: APIManager){
        self.apiManager = apiManager
    }
    
    func fetchData(_ searchTerm: String) {
        
        guard searchTerm.count > 0 else {
            print("ViewModel Logger:: empty searching string!!")
            return
        }
        
        let searchUrl = Constants.serverUrl.rawValue + searchTerm.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        apiManager.fetchData(from: searchUrl) { [weak self] (searchResult: AudiobookResponse?) in
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
    
    func getAudioFor(row: Int) -> Audiobook? {
        if row < audiobooks.count {
            return audiobooks[row]
        }
        return nil
    }
}
