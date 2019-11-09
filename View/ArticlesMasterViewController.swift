//
//  ViewController.swift
//  NewYork Time Demo
//
//  Created by RAKESH BISWAL on 09/11/19.
//  Copyright © 2019 RAKESH BISWAL. All rights reserved.
//


import UIKit


class ArticlesMasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var articleViewModels = [ArticleViewModel](){
        didSet {
            tableView.tableFooterView = UIView()  
            tableView.isHidden = !(articleViewModels.count > 0)
            noDataTitle.isHidden = (articleViewModels.count > 0)
        }
    }
    let articleCellId = "ArticleCellId"
    let detailsSegueId = "showArticleDetail"
    var selectedArticle: ArticleViewModel!
    
    @IBOutlet weak var noDataTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimation()
        tableView.tableFooterView = UIView()
        setupTableView()
        getArticles()
    }

    func setupTableView() {
        let articleNib = UINib(nibName: "ArticleTableViewCell", bundle: nil)
        self.tableView.register(articleNib, forCellReuseIdentifier: articleCellId)
    }
    
    func getArticles() {
        ApiManager.getArticles(period: .week, success: { [weak self] articles in
            self?.articleViewModels = articles.map{ArticleViewModel(article: $0)}
            self?.tableView.reloadData()
            self?.stopAnimation()
        }, failure: { [weak self] errorMessage in
            self?.showAlert(title: "Error", message: errorMessage)
        })
    }
    
    // MARK: - Table view data source
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleViewModels.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let articleCell = tableView.dequeueReusableCell(withIdentifier: articleCellId, for: indexPath) as! ArticleTableViewCell
        articleCell.articleViewModel = articleViewModels[indexPath.row]
        return articleCell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedArticle = articleViewModels[indexPath.row]
        performSegue(withIdentifier: detailsSegueId, sender: nil)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        var shownIndexes : [IndexPath] = []
        let CELL_HEIGHT : CGFloat = 40
        
        if !(shownIndexes.contains(indexPath)) {
            shownIndexes.append(indexPath)
            
            cell.transform = CGAffineTransform(translationX: 0, y: CELL_HEIGHT)
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: 10, height: 10)
            cell.alpha = 0
            
            UIView.beginAnimations("rotation", context: nil)
            UIView.setAnimationDuration(0.5)
            cell.transform = CGAffineTransform(translationX: 0, y: 0)
            cell.alpha = 1
            cell.layer.shadowOffset = CGSize(width: 0, height: 0)
            UIView.commitAnimations()
        }
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == detailsSegueId {
            let detailsVC = segue.destination as! ArticleDetailsViewController
            detailsVC.articleViewModel = selectedArticle
        }
    }
    

}







