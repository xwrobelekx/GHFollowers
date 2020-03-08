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
    
    //MARK: - Properties
    weak var delegate: GFRepoItemVCDelegate!
    
    
    //MARK: - Initalizers
    init(user: User, delegate: GFRepoItemVCDelegate){
        super.init(user: user)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    //MARK: - Configure Methods
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, with: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, with: user.publicGists)
        actionButton.set(backgroudColor: .systemPurple, title: "GitHub Profile")
    }
    
    
    //MARK: - Action Methods
    override func actionButtonTapped() {
        delegate.didTapGitGubProfile(for: user)
    }
}


