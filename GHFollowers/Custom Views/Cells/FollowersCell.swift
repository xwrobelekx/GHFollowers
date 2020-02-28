//
//  FollowersCell.swift
//  GHFollowers
//
//  Created by Kamil Wrobel on 2/27/20.
//  Copyright © 2020 Kamil Wrobel. All rights reserved.
//

import UIKit

class FollowersCell: UICollectionViewCell {
    
    static let reuseID = "FollowersCell"
    let avatarImaheView = GFAvatarImageView(frame: .zero)
    let userNameLabel = GFTitleLabel(textAlligment: .center, fontSize: 16)
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(follower: Follower) {
        userNameLabel.text = follower.login
    }
    
    private func configure() {
        addSubview(avatarImaheView)
        addSubview(userNameLabel)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImaheView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImaheView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImaheView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImaheView.heightAnchor.constraint(equalTo: avatarImaheView.widthAnchor),
            
            userNameLabel.topAnchor.constraint(equalTo: avatarImaheView.bottomAnchor, constant: 12),
            userNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            userNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}
