//
//  LatestNewsCVC.swift
//  News Board
//
//  Created by Spemai-Macbook on 2022-06-26.
//

import UIKit
import SDWebImage

class LatestNewsCVC: UICollectionViewCell {

    @IBOutlet weak var viwBack: UIView!
    @IBOutlet weak var imgBanner: UIImageView!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgBlur: UIVisualEffectView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgBanner.layer.cornerRadius = 8

        imgBanner.sd_imageIndicator = SDWebImageActivityIndicator.gray
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imgBanner?.image = nil
        lblAuthor.text   = ""
        lblTitle.text    = ""
    }
    
    func setupUI(article: Article) {
        
      
        DispatchQueue.main.async {

            //Show Poster image
            if let path = article.urlToImage,  let poster_url = URL(string: path) {
                self.imgBanner.sd_setImage(with: poster_url)
            }


        }

        if let author = article.author {
            self.lblAuthor.text = "by \(author.lowercased().capitalized)"
        }
        
        if let title = article.title {
            self.lblTitle.text = title
        }
        
        if let description = article.description {
            self.lblDescription.text = description
        }
    }

}
