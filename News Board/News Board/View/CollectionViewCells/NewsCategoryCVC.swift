//
//  NewsCategoryCVC.swift
//  News Board
//
//  Created by Spemai-Macbook on 2022-06-26.
//

import UIKit

class NewsCategoryCVC: UICollectionViewCell {

    @IBOutlet weak var viwBack: UIView!
    @IBOutlet weak var lblTxt: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viwBack.layer.cornerRadius = 16
        viwBack.layer.borderWidth  = 1
        viwBack.layer.borderColor = UIColor(red: 0.94, green: 0.943, blue: 0.98, alpha: 1).cgColor
    }

    func setupUI(name: String)  {
        
        lblTxt.text = name
    }
    
    
    func isSelected(value: Bool)  {
        
        if value {
            
            selectCell()
            
        }else{
            
            unSelectCell()
        }
        
    }
    
    private func selectCell() {
        viwBack.backgroundColor = UIColor(named: "AccentColor")
        lblTxt.textColor = UIColor.white
    }
    
    private func unSelectCell() {
        viwBack.layer.borderWidth  = 1
        viwBack.layer.borderColor = UIColor(red: 0.94, green: 0.943, blue: 0.98, alpha: 1).cgColor
        viwBack.layer.backgroundColor = UIColor.white.cgColor
        lblTxt.textColor = UIColor.black

    }
    
    
}
