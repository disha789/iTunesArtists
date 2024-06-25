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
    var viewModel: ArtistListViewModel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: ViewLifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        viewModel = ArtistListViewModel(apiManager: MockAPIManager())
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
        if let audioBook = viewModel.getAudioFor(row: indexPath.row) {
            cell.setUp(audioBook: audioBook)
        }
        return cell
    }
}
