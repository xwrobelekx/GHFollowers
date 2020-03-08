//
//  UITableView + Ext.swift
//  GHFollowers
//
//  Created by Kamil Wrobel on 3/6/20.
//  Copyright © 2020 Kamil Wrobel. All rights reserved.
//

import UIKit

extension UITableView {
    
    func reloadDataOnMAinQueue() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
