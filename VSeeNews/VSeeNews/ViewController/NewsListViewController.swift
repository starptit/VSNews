//
//  NewsListViewController.swift
//  VSeeNews
//
//  Created by _Genesis_ on 12/11/17.
//  Copyright © 2017 _Genesis_. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import SVPullToRefresh

class NewsListViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initDependency()
        callAPIGetData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initDependency(){
        articleService = ArticleService()
    }
    
    override func initUI() {
        setupTableView()
        setupNavigationBar()
    }
    
    override func initData() {
        mappingArticleList()
        
        //pull to refresh
        newsTableView.addPullToRefresh { [weak self] in
            self?.callAPIGetData()
        }
        newsTableView.pullToRefreshView.stopAnimating()
    }
    
    func setupTableView(){
        newsTableView.delegate = self
        newsTableView.dataSource = self
        
        newsTableView.tableHeaderView = UIView()
        newsTableView.tableFooterView = UIView()
        
        newsTableView.estimatedRowHeight = 44
        newsTableView.rowHeight = UITableViewAutomaticDimension
        
        newsTableView.separatorStyle = .none
        newsTableView.register(ArticleTableViewCell.self)

    }
    
    func setupNavigationBar(){
        self.navigationController?.navigationBar.topItem?.title = "NEWS"
        self.navigationController?.navigationBar.barTintColor = UIColor(hex:"D93829")
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barStyle = .default
    }
    

    //MARK: - Processing Controller
    
    func callAPIGetData(){
        articleService?.fetchListArticle(withCompletion: {[weak self] (articleList, error) in
            if (error != nil){
                //TODO : handle error
            }else{
                RealmConnectorManager.sharedDefaultManager.createListRecord(listRecord: articleList)
                self?.mappingArticleList()
                self?.newsTableView.reloadData()
            }
            self?.newsTableView.pullToRefreshView.stopAnimating()
        })
    }

    func mappingArticleList(){
        articleList = RealmConnectorManager.sharedDefaultManager.getAllRecord(objecType: ArticleEntity.self) as? [ArticleEntity] ?? []
    }
    
    
    // MARK: - Navigation

    func navigateArticleDetailScreen(withEntity articleEntity:ArticleEntity){
        self.performSegue(withIdentifier: ConstantDefine.articleDetailIdentifier, sender: articleEntity)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let screenDetail = segue.destination as? NewsDetailViewController,
            let articlePassing = sender as? ArticleEntity{
            screenDetail.articleEntity = articlePassing
        }
    }
    

    //MARK: - Class variables
    lazy fileprivate var articleList:[ArticleEntity] = []
    lazy fileprivate var articleService:ArticleAbstractService? = nil
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    //MARK: - IBOutlet references
    @IBOutlet weak fileprivate var newsTableView: UITableView!
    
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension NewsListViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleList.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseArticleCell:ArticleTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        if indexPath.row < articleList.count{
            let articleEntity = articleList[indexPath.row]
            reuseArticleCell.configureCell(with: articleEntity)
        }
        return reuseArticleCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < articleList.count{
            let articleEntity = articleList[indexPath.row]
            navigateArticleDetailScreen(withEntity: articleEntity)
        }
    }
}

extension UINavigationController{
    open override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}





