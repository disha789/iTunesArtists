//
//  APIManager.swift
//  TableViewAPIManager
//
//  Created by Disha patel on 6/12/24.
//

import UIKit

class APIManager {
    static var shared = APIManager()
    
    private init() {}
    
    public func fetchData<T: Decodable>(url: String, completion: @escaping (T?) -> ()) {
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

            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(decodedData)
            } catch {
                print("\(ServerErrors.unableConversionObject.rawValue): \(error)")
                completion(nil)
            }
        }.resume()
    }
}

//    static let sharedInstance = APIManager()
//
//    func getAudioFromServer(url: String, closure: @escaping ((Data?) -> ()) ) {
//
//        guard let serverURL = URL(string: url) else {
//            print(ServerErrors.invalidServerUrl.rawValue)
//            closure(nil)
//            return
//        }
//
//        URLSession.shared.dataTask(with: URLRequest(url: serverURL) ) { data, response, error in
//            if error != nil {
//                print(ServerErrors.fetchingDataError.rawValue)
//                closure(nil)
//                return
//            }
//            closure(data)
//        }.resume()
//    }

