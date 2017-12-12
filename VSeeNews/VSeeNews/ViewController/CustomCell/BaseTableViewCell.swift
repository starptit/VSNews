//
//  BaseTableViewCell.swift
//  VSeeNews
//
//  Created by _Genesis_ on 12/12/17.
//  Copyright © 2017 _Genesis_. All rights reserved.
//

import UIKit
import Kingfisher

class BaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initUI()
    }

    func initUI(){
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
