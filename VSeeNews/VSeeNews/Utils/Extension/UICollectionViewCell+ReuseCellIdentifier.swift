//
//  UICollectionViewCell+ReuseCellIdentifier.swift
//  VSeeNews
//
//  Created by _Genesis_ on 12/10/17.
//  Copyright © 2017 _Genesis_. All rights reserved.
//

import UIKit


extension UICollectionView{
    
    func register<T:UICollectionViewCell> (_: T.Type) where T:ReusableView, T:NibLoadableView{
        let nib = UINib(nibName: T.NibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell <T: UICollectionViewCell>(forIndexPath indexPath:IndexPath) -> T where T:ReusableView {
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else{
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
        
    }
    
}

extension UICollectionViewCell:ReusableView,NibLoadableView{

}

extension UICollectionReusableView:ReusableView,NibLoadableView{
    
}
