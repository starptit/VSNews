//
//  NewsDetailViewController.swift
//  VSeeNews
//
//  Created by _Genesis_ on 12/11/17.
//  Copyright © 2017 _Genesis_. All rights reserved.
//

import UIKit
import SnapKit
import WebKit

class NewsDetailViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func initUI() {
        setupWebView()
        setupFailedView()
    }
    
    override func initData() {
        webView.navigationDelegate = self
        loadWebView()
    }
    
    func setupWebView(){
        mainContentView.addSubview(webView)
        webView.snp.makeConstraints { (maker) in
            maker.leading.equalTo(mainContentView.snp.leading).offset(0)
            maker.trailing.equalTo(mainContentView.snp.trailing).offset(0)
            maker.top.equalTo(mainContentView.snp.top).offset(0)
            maker.bottom.equalTo(mainContentView.snp.bottom).offset(0)
        }
    }
    
    func setupFailedView(){
        mainContentView.addSubview(failedLoadingView)
        mainContentView.bringSubview(toFront: failedLoadingView)
        
        failedLoadingView.snp.makeConstraints { (maker) in
            maker.leading.equalTo(mainContentView.snp.leading).offset(0)
            maker.trailing.equalTo(mainContentView.snp.trailing).offset(0)
            maker.top.equalTo(mainContentView.snp.top).offset(0)
            maker.bottom.equalTo(mainContentView.snp.bottom).offset(0)
        }
        
        failedLoadingImage.contentMode = .scaleAspectFit
        failedLoadingImage.image = #imageLiteral(resourceName: "fail_loading")
        failedLoadingView.addSubview(failedLoadingImage)
        failedLoadingImage.snp.makeConstraints { (maker) in
            maker.centerX.equalTo(failedLoadingView.snp.centerX).offset(0)
            maker.centerY.equalTo(failedLoadingView.snp.centerY).offset(0)
            maker.width.equalTo(60)
            maker.height.equalTo(60)
        }
        
        failedLoadingText.text = "Cannot Load Content"
        failedLoadingText.textAlignment = .center
        failedLoadingView.addSubview(failedLoadingText)
        failedLoadingText.snp.makeConstraints { (maker) in
            maker.top.equalTo(failedLoadingImage.snp.bottom).offset(16)
            maker.leading.equalTo(failedLoadingView.snp.leading).offset(16)
            maker.trailing.equalTo(failedLoadingView.snp.trailing).offset(16)
        }
     
        failedLoadingView.isHidden = true
    }
    
    func loadWebView(){
        if let urlLoading = URL(string: articleEntity?.url ?? ""){
            let urlRequest = URLRequest(url: urlLoading)
            webView.load(urlRequest)
        }
        
    }
    
    //MARK: - Class variables
    lazy var articleEntity:ArticleEntity? = nil
    lazy var webView:WKWebView = WKWebView()
    lazy var failedLoadingView = UIView()
    lazy var failedLoadingImage = UIImageView()
    lazy var failedLoadingText = UILabel()


    //MARK: - IBOutlet references
    @IBOutlet weak var mainContentView: UIView!
    
}

//MARK: - WKNavigationDelegate
extension NewsDetailViewController:WKNavigationDelegate{
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        Log.debug(message: error.localizedDescription)
        failedLoadingView.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }
   
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        completionHandler(.useCredential, nil)
    }
    
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        
    }
}



