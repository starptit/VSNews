//
//  UITableViewCell+ReuseCellIdentifier.swift
//  VSeeNews
//
//  Created by _Genesis_ on 12/10/17.
//  Copyright © 2017 _Genesis_. All rights reserved.
//

import UIKit


protocol ReusableView {
    
}

extension ReusableView where Self:UIView{
    static var reuseIdentifier:String{
        return String(describing: self)
    }
}

protocol NibLoadableView {
    
}
extension NibLoadableView where Self:UIView{
    static var NibName:String{
        return String(describing: self)
    }
}

extension UITableView{
    
    func register<T:UITableViewCell> (_: T.Type) where T:ReusableView, T:NibLoadableView{
        let nib = UINib(nibName: T.NibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell <T: UITableViewCell>(forIndexPath indexPath:IndexPath) -> T where T:ReusableView {
        
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else{
            fatalError("Could not dequeue table cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
        
    }
    
    func register<T:UITableViewHeaderFooterView> (_: T.Type) where T:ReusableView, T:NibLoadableView{
        let nib = UINib(nibName: T.NibName, bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeReuseHeaderFooterView<T:UITableViewHeaderFooterView>() -> T where T:ReusableView{
        guard let reuseView = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else{
            fatalError("Could not dequeue table header view with identifier: \(T.reuseIdentifier)")
        }
        
        return reuseView
    }
}

extension UITableViewCell:ReusableView,NibLoadableView{
    
}

extension UITableViewHeaderFooterView:ReusableView,NibLoadableView{
    
}
