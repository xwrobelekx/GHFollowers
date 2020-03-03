//
//  GFFollowerItemVC.swift
//  GHFollowers
//
//  Created by Kamil Wrobel on 3/2/20.
//  Copyright © 2020 Kamil Wrobel. All rights reserved.
//

import UIKit


class GFFollowerItemVC : GFItemInfoVC {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, with: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, with: user.following)
        actionButton.set(backgroudColor: .systemGreen, title: "Get Followers")
    }
}
