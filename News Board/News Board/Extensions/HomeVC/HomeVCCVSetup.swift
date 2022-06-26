//
//  HomeVCCVSetup.swift
//  News Board
//
//  Created by Spemai-Macbook on 2022-06-26.
//

import Foundation
import UIKit

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.clvCategory {
            
            return Constant.NEWS_CATEGORIES.count
            
        }else {
            
            return self.latestArticles.count
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.clvCategory {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.NEWS_CATEGORY_COLLECTION_VIEW_CELL, for: indexPath) as! NewsCategoryCVC
            
            cell.setupUI(name: Constant.NEWS_CATEGORIES[indexPath.row])
            
            if selectedIndexPath != nil && indexPath == selectedIndexPath {
                cell.isSelected(value: true)
            }else{
                cell.isSelected(value: false)
            }
            
            return cell
            
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.LATEST_NEWS_COLLECTION_VIEW_CELL, for: indexPath) as! LatestNewsCVC
            
            let data = self.latestArticles[indexPath.row]
            
            cell.setupUI(article: data)
            
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.clvCategory {
            
            return CGSize(width: 100, height: collectionView.frame.height - 5)
            
        } else {
            
            return CGSize(width: collectionView.frame.height + 80, height: collectionView.frame.height - 5)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.clvCategory {
            
            if let cell = collectionView.cellForItem(at: indexPath) as? NewsCategoryCVC {
                selectedIndexPath = indexPath
                cell.isSelected(value: true)
                
                DispatchQueue.main.async {
                    self.loadTopNews()
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == self.clvCategory {
            
            if let cell = collectionView.cellForItem(at: indexPath) as? NewsCategoryCVC {
                cell.isSelected(value: false)
                selectedIndexPath = nil
            }
        }
    }
}
