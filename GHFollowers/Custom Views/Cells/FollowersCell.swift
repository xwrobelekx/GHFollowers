//
//  FollowersCell.swift
//  GHFollowers
//
//  Created by Kamil Wrobel on 2/27/20.
//  Copyright © 2020 Kamil Wrobel. All rights reserved.
//

import UIKit

class FollowersCell: UICollectionViewCell {
    
    //MARK: - Properties
    static let reuseID = "FollowersCell"
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let userNameLabel = GFTitleLabel(textAlligment: .center, fontSize: 16)
    
    
    //MARK: - Initalizers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Configure Methods
    private func configure() {
        addSubviews(avatarImageView, userNameLabel)
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            userNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            userNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            userNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    
    //MARK: - Helper Methods
    func set(follower: Follower) {
        avatarImageView.downloadImage(from: follower.avatarUrl)
        userNameLabel.text = follower.login
    }
}
