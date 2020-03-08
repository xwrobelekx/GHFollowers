//
//  UIView + Ext.swift
//  GHFollowers
//
//  Created by Kamil Wrobel on 3/6/20.
//  Copyright © 2020 Kamil Wrobel. All rights reserved.
//

import UIKit

extension UIView {
    
    func pinToEdges(of superview: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        
        ])
    }
    
    func addSubviews(_ views: UIView...){
        views.forEach { view in
            addSubview(view)
        }
    }
}
