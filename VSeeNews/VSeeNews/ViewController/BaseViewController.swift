//
//  BaseViewController.swift
//  VSeeNews
//
//  Created by _Genesis_ on 12/11/17.
//  Copyright © 2017 _Genesis_. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setNeedsStatusBarAppearanceUpdate()
        initUI()
        initData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initUI(){
        
    }
    
    func initData(){
        
    }

    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
