//
//  APIManager.swift
//  TableViewAPIManager
//
//  Created by Disha patel on 6/12/24.
//

import UIKit

class APIManager {
    static var shared = APIManager()
    
    //private init() {}
    
    public func fetchData(from url: String, completion: @escaping ((AudiobookResponse?) -> ())) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let error = error {
                print("\(ServerErrors.fetchingDataError.rawValue): \(error)")
                completion(nil)
                return
            }
            guard let data = data else {
                completion(nil)
                return
            }
            completion(self.parseResponseFor(audiobookData: data))
        }.resume()
    }
    
    func parseResponseFor(audiobookData: Data) -> AudiobookResponse? {
        let audioBookResponse: AudiobookResponse?
        do {
            audioBookResponse = try JSONDecoder().decode(AudiobookResponse.self, from: audiobookData)
            return audioBookResponse
        } catch {
            print("\(ServerErrors.unableConversionObject.rawValue): \(error)")
        }
        
        return nil
    }
}
 

