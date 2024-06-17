//
//  TableViewAPIManagerTests.swift
//  TableViewAPIManagerTests
//
//  Created by Disha patel on 6/12/24.
//

import XCTest
@testable import TableViewAPIManager

final class TableViewAPIManagerTests: XCTestCase {

    var viewModel: ArtistListViewModel?
    
    override func setUpWithError() throws {
        viewModel = ArtistListViewModel()
        
        viewModel?.audiobooks = [
            Audiobook(artistName: "Artist1", country: "Country1", primaryGenreName: "Genre1", collectionPrice: 10.00, artworkUrl60: "home"),
            Audiobook(artistName: "Artist2", country: "Country2", primaryGenreName: "Genre2", collectionPrice: 0.0, artworkUrl60: "music")
        ]
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testGetAudioCount() {
        let count = viewModel?.getAudioCount()
        XCTAssertEqual(count, 2)
    }
    
    func testGetAudioForValidIndex() {
        let audiobook = viewModel?.getAudioFor(row: 0)
        XCTAssertEqual(audiobook?.artistName, "Artist1")
        XCTAssertEqual(audiobook?.primaryGenreName, "Genre1")
    }

}
