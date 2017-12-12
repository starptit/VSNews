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
    
    func loadWebView(){
        if let urlLoading = URL(string: articleEntity?.url ?? ""){
            let urlRequest = URLRequest(url: urlLoading)
            webView.load(urlRequest)
        }
        
    }
    
    //MARK: - Class variables
    lazy var articleEntity:ArticleEntity? = nil
    lazy var webView:WKWebView = WKWebView()


    //MARK: - IBOutlet references
    @IBOutlet weak var mainContentView: UIView!
    
}

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

/*
extension NewsDetailViewController:WKUIDelegate{
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        
    }
    
    func webViewDidClose(_ webView: WKWebView) {
        
    }
    
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        
    }
    
    
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        
    }
    
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        
    }
    
    
    func webView(_ webView: WKWebView, shouldPreviewElement elementInfo: WKPreviewElementInfo) -> Bool {
        return true
    }
    
    func webView(_ webView: WKWebView, previewingViewControllerForElement elementInfo: WKPreviewElementInfo, defaultActions previewActions: [WKPreviewActionItem]) -> UIViewController? {
        
    }
    
    func webView(_ webView: WKWebView, commitPreviewingViewController previewingViewController: UIViewController) {
        
    }
}*/




