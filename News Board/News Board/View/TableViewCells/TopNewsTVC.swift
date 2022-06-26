//
//  TopNewsTVC.swift
//  News Board
//
//  Created by Spemai-Macbook on 2022-06-26.
//

import UIKit
import SDWebImage
import MapKit

class TopNewsTVC: UITableViewCell {

    @IBOutlet weak var imgBanner: UIImageView!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        imgBanner.layer.cornerRadius = 8
        imgBanner.sd_imageIndicator = SDWebImageActivityIndicator.gray

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI(article: Article) {
        
      
        DispatchQueue.main.async {

            //Show Poster image
            if let path = article.urlToImage,  let poster_url = URL(string: path) {
                
                self.imgBanner.sd_setImage(with: poster_url, placeholderImage: nil, options: .continueInBackground, completed: nil)

            } else {
                
                self.imgBanner.sd_imageIndicator = nil
                self.imgBanner.image = UIImage(named: "no_image")
            }

         
        }

        if let author = article.author {
            self.lblAuthor.text = "\(author.lowercased().capitalized)"
        } else {
            self.lblAuthor.text = ""
        }

        
        if let title = article.title {
            self.lblTitle.text = title
        } else {
            self.lblAuthor.text = ""
        }
    }
}
