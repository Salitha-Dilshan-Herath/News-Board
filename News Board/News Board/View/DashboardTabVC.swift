//
//  DashboardTabVC.swift
//  News Board
//
//  Created by Spemai-Macbook on 2022-06-26.
//

import UIKit

class DashboardTabVC: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: 30, y: tabBar.bounds.minY , width: tabBar.bounds.width - 60, height: tabBar.bounds.height + 10), cornerRadius: (tabBar.frame.width/2)).cgPath
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        layer.shadowRadius = 25.0
        layer.shadowOpacity = 0.3
        layer.borderWidth = 1.0
        layer.opacity = 1.0
        layer.isHidden = false
        layer.masksToBounds = false
        layer.fillColor = UIColor.white.cgColor
      
        tabBar.layer.insertSublayer(layer, at: 0)

        if let items = tabBar.items {
            items.forEach { item in
                item.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -5, right: 0)
            }
        }

        tabBar.itemWidth = 30.0
        tabBar.itemPositioning = .automatic
      }

}
