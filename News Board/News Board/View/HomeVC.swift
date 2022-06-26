//
//  HomeVC.swift
//  News Board
//
//  Created by Spemai-Macbook on 2022-06-26.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var clvLatestNews: UICollectionView!
    @IBOutlet weak var clvCategory: UICollectionView!
    @IBOutlet weak var tblTopNews: UITableView!
    
    let viewModel = HomeViewModel()
    var latestArticles = [Article]()
    var topArticles = [Article]()
    let progressHUD  = ProgressHUD(text: "Loading...")
    var selectedIndexPath: IndexPath?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }
    
    func setupUI(){
        
        self.view.addSubview(progressHUD)
        
        self.clvLatestNews.register(UINib(nibName: "LatestNewsCVC", bundle: nil), forCellWithReuseIdentifier: Constant.LATEST_NEWS_COLLECTION_VIEW_CELL)
        self.clvCategory.register(UINib(nibName: "NewsCategoryCVC", bundle: nil), forCellWithReuseIdentifier: Constant.NEWS_CATEGORY_COLLECTION_VIEW_CELL)
        self.tblTopNews.register(UINib(nibName: "TopNewsTVC", bundle: nil), forCellReuseIdentifier: Constant.TOP_NEWS_TABLE_CELL)
        
        
        self.progressHUD.show()
        viewModel.loadTopHeadLines(category: "", country: "us", isRest: true) { result in
            
            self.progressHUD.hide()
            
            switch result {
                
            case .success(let list):
                
                DispatchQueue.main.async {
                    self.latestArticles = list
                    self.clvLatestNews.reloadData()
                    
                    
                    self.clvCategory.selectItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, animated: false, scrollPosition: .centeredHorizontally)
                    self.collectionView(self.clvCategory, didSelectItemAt: IndexPath(item: 0, section: 0))
                    
                    
                    
                    self.loadTopNews(isRest: true)
                }
                
            case .failure(let error):
                
                print(error)
            }
        }
    }
    
    func loadTopNews(isRest: Bool) {
        
        
        self.progressHUD.show()
        
        let selected_category = Constant.NEWS_CATEGORIES[self.selectedIndexPath?.row ?? 0]
        
        viewModel.loadTopHeadLines(category: selected_category, country: "us", isRest: isRest) { result in
            
            self.progressHUD.hide()
            
            switch result {
                
            case .success(let list):
                
                DispatchQueue.main.async {
                    self.topArticles.append(contentsOf: list)
                    self.tblTopNews.reloadData()
                }
                
            case .failure(let error):
                
                print(error)
            }
        }
    }
}
