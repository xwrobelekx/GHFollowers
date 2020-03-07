//
//  GFRepoItemVC.swift
//  GHFollowers
//
//  Created by Kamil Wrobel on 3/2/20.
//  Copyright © 2020 Kamil Wrobel. All rights reserved.
//

import UIKit

protocol GFRepoItemVCDelegate: class {
    func didTapGitGubProfile(for user: User)
}


class GFRepoItemVC : GFItemInfoVC {
    
    weak var delegate: GFRepoItemVCDelegate!
    
    init(user: User, delegate: GFRepoItemVCDelegate){
        super.init(user: user)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, with: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, with: user.publicGists)
        actionButton.set(backgroudColor: .systemPurple, title: "GitHub Profile")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGitGubProfile(for: user)
    }
}


