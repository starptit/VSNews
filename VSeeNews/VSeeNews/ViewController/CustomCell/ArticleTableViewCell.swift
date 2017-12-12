//
//  ArticleTableViewCell.swift
//  VSeeNews
//
//  Created by _Genesis_ on 12/12/17.
//  Copyright © 2017 _Genesis_. All rights reserved.
//

import UIKit

class ArticleTableViewCell: BaseTableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }
    
    override func prepareForReuse() {
        refreshImageCache()
    }
    
    func refreshImageCache(){
        articleImageView.image = UIImage(named:"image_not_avail")
    }

    override func initUI() {
        selectionStyle = .none
    }
    
    func configureCell(with articleEntity:ArticleEntity){
        refreshImageCache()
        if let urlImage = URL(string: articleEntity.urlImage ?? ""){
            articleImageView.kf.setImage(with: urlImage, placeholder: nil, options: nil, progressBlock: nil) { [weak self] (image, error, cache, url) in
                if error != nil{
                    self?.refreshImageCache()
                    return
                }
            }
        }
        
        articleTitleLabel.text = articleEntity.title
        articleDescriptionLabel.text = articleEntity.desc
        articlePublishDateLabel.text = articleEntity.publishDate?.convertToString(withFormat: "MM-dd-yyyy")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    //MARK: - IBOutlet references
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var articleDescriptionLabel: UILabel!
    @IBOutlet weak var articlePublishDateLabel: UILabel!
    
    
}
