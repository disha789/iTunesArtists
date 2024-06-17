//
//  ArtistTableViewCell.swift
//  TableViewAPIManager
//
//  Created by Disha patel on 6/12/24.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceButton: UIButton!
    @IBOutlet weak var artistImageView: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    
    //var audioBook: Audiobook?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        buttonSetup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func buttonSetup(){
            priceButton.layer.borderColor = UIColor.blue.cgColor
            priceButton.layer.borderWidth = 1.0
            priceButton.layer.cornerRadius = 5.0
            priceButton.layer.masksToBounds = true
            
    }
    
    // MARK: Custom Methods
    
    func setUp(audioBook: Audiobook) {
        artistLabel.text = audioBook.artistName
        guard let country = audioBook.country else{
            return
        }
        guard let genre = audioBook.primaryGenreName else{
            return
        }
        descriptionLabel.text = "\(country) - \(genre)"
        priceButton.setTitle("\(audioBook.collectionPrice ?? 0.0)".getFormattedPrice(), for: .normal)
        
        guard let imageUrlString = audioBook.artworkUrl60 else { return }
            guard let imageUrl = URL(string: imageUrlString) else { return }

            URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                guard let data = data, error == nil else {
                    return
                }
                DispatchQueue.main.async {
                    self.artistImageView?.image = UIImage(data: data)
                }
            }.resume()
        
//        APIManager.shared.fetchData(url: audioBook.artworkUrl60 ?? "") { data in
//            guard let receivedImageData = data else {
//                print("Image error..")
//                return
//            }
//            DispatchQueue.main.async {
//                self.artistImageView?.image = UIImage(data: receivedImageData)
//            }
//        }
    }
}
