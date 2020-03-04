//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Kamil Wrobel on 3/3/20.
//  Copyright © 2020 Kamil Wrobel. All rights reserved.
//

import Foundation


extension Date {
    
    func convertToMonthTearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
