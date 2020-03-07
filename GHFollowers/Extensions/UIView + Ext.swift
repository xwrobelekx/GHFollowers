//
//  UIView + Ext.swift
//  GHFollowers
//
//  Created by Kamil Wrobel on 3/6/20.
//  Copyright © 2020 Kamil Wrobel. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...){
        views.forEach { view in
            addSubview(view)
        }
    }
}
