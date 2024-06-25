//
//  TableViewAPIManagerTests.swift
//  TableViewAPIManagerTests
//
//  Created by Disha patel on 6/12/24.
//

import XCTest
@testable import TableViewAPIManager

final class TableViewAPIManagerTests: XCTestCase {
    
    var objArtistListViewModel: ArtistListViewModel?
    var objAPIManager: APIManager?
    
    override func setUpWithError() throws {
        objArtistListViewModel = ArtistListViewModel(apiManager: APIManager.shared)
        objAPIManager = APIManager.shared
    }

    override func tearDownWithError() throws {
        objArtistListViewModel = nil
        objAPIManager = nil
    }
 
    func testVMFetchDataForEmptySearchString() {
        objArtistListViewModel?.fetchData("")
        XCTAssertEqual(objArtistListViewModel?.getAudioCount(), 0)
        
        objArtistListViewModel = MockArtistListViewModel(apiManager: APIManager.shared)
        objArtistListViewModel?.fetchData("a")
        XCTAssertEqual(objArtistListViewModel?.getAudioCount(), 1)
    }
    
    func testFetchDataUpdatesAudiobooks() {
        objArtistListViewModel = MockArtistListViewModel(apiManager: MockAPIManager())
        objArtistListViewModel?.fetchData("abc")
        XCTAssertEqual(self.objArtistListViewModel?.audiobooks.count, 1)
        XCTAssertEqual(self.objArtistListViewModel?.audiobooks.first?.artistName, "")
    }
    
    func testGetAudioCount() {
        let result = objArtistListViewModel?.getAudioCount()
        XCTAssertEqual(result, 0)
    }
    
    func testGetAudioFor() {
        let resultNilAudioBook = objArtistListViewModel?.getAudioFor(row: 0)
        XCTAssertNil(resultNilAudioBook)
        
        // Inject mock data
        objArtistListViewModel?.audiobooks = [Audiobook(artistName: "", country: "", primaryGenreName: "", collectionPrice: 0.0, artworkUrl60: "")]
        
        let resultAudioBook = objArtistListViewModel?.getAudioFor(row: 0)
        XCTAssertNotNil(resultAudioBook)
    }
    
    func testFetchData() {
        objAPIManager?.fetchData(from: "", completion: { audioBookResponse in
            XCTAssertNil(audioBookResponse)
        })
    }
    
    func testParseResponseForAudioBooks() {
       let parsedValue =  objAPIManager?.parseResponseFor(audiobookData: Data())
        XCTAssertNil(parsedValue)
    }
}
