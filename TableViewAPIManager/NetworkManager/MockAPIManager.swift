//
//  MockAPIManager.swift
//  TableViewAPIManager
//
//  Created by Disha patel on 6/21/24.
//

import Foundation

class MockAPIManager: APIManager {

    override public func fetchData(from url: String, completion: @escaping ((AudiobookResponse?) -> ())) {
        guard let _ = URL(string: url) else {
            completion(nil)
            return
        }
        
        let audioBook = Audiobook(artistName: "Tailor", country: "USA", primaryGenreName: "Fantasy", collectionPrice: 19.99, artworkUrl60: "https://example.com/artwork.jpg")
        let audiobookResponse = AudiobookResponse(results: [audioBook])
        
        completion(audiobookResponse)
    }
}
