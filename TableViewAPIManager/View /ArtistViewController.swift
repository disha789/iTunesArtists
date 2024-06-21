//
//  ViewController.swift
//  TableViewAPIManager
//
//  Created by Disha patel on 6/12/24.
//

import UIKit

class ArtistViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var artistSearchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    private var viewModel = ArtistListViewModel()
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    // MARK: ViewLifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        viewModel.delegate = self
        artistSearchBar.delegate = self
        navigationSetup()
    }
    
    func navigationSetup(){
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.backgroundColor = .black
    }
}

extension ArtistViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.fetchData(searchText.isEmpty ? "" : searchText)
    }
}

extension ArtistViewController: ArtistListDataProtocol {
    func didFetchArtistData(searchBarText: String) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.activityIndicator.stopAnimating()
        }
    }
}

// MARK: TableView DataSource
extension ArtistViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getAudioCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.artistCell.rawValue, for: indexPath) as! ArtistTableViewCell
        let obj = viewModel.getAudioFor(row: indexPath.row)
        cell.setUp(audioBook: obj)
        return cell
    }
}




// MARK: Fetching Audio Books
//extension ArtistViewController {
//    private func fetchAudiobooks() {
//        let successClosure: ((Data?) -> ())  = { data in
//            guard let serverData = data else {
//                return
//            }
//            self.processParsing(data: serverData)
//        }
//        
//        // Fetching data from server
//        activityIndicator.startAnimating()
//        
//        DispatchQueue.global(qos: .background).async {
//            APIManager.sharedInstance.getAudioFromServer(url: Constants.serverUrl.rawValue, closure: successClosure)
//        }
//    }
//    
//    func processParsing(data: Data){
//        
//        do {
//            let audioResponse = try JSONDecoder().decode(AudiobookResponse.self, from: data)
//            self.audiobooks = audioResponse.results
//            refreshTableView()
//        } catch {
//            print(ServerErrors.unableConversionObject.rawValue, "\(error)")
//            activityIndicator.stopAnimating()
//        }
//    }
//    
//    func refreshTableView(){
//        DispatchQueue.main.async {
//            self.activityIndicator.stopAnimating()
//            self.tableView.reloadData()
//        }
//    }
//}
