//
//  GFFollowerItemVC.swift
//  GHFollowers
//
//  Created by Kamil Wrobel on 3/2/20.
//  Copyright © 2020 Kamil Wrobel. All rights reserved.
//

import UIKit

protocol GFFollowerItemVCDelegate: class {
    func didTapGetFollowers(for user: User)
}

class GFFollowerItemVC : GFItemInfoVC {
    
    
    //MARK: - Preoperties
    weak var delegate: GFFollowerItemVCDelegate!
    
    
    //MARK: Initalizers
    init(user: User, delegate: GFFollowerItemVCDelegate){
        super.init(user: user)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    //MARK: - Configure Methods
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, with: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, with: user.following)
        actionButton.set(backgroudColor: .systemGreen, title: "Get Followers")
    }
    
    
    //MARK: - Action Methods
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
