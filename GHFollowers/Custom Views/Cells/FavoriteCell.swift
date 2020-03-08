//
//  FavoriteCell.swift
//  GHFollowers
//
//  Created by Kamil Wrobel on 3/4/20.
//  Copyright © 2020 Kamil Wrobel. All rights reserved.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
    //MARK: - Properties
    
    static let reuseID = "FavoriteCell"
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let userNameLabel = GFTitleLabel(textAlligment: .left, fontSize: 26)
    
    
    //MARK: - Initalizers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Configure Methods
    private func configure() {
        addSubviews(avatarImageView, userNameLabel)
        accessoryType = .disclosureIndicator
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
            avatarImageView.widthAnchor.constraint(equalToConstant: 60),
            
            userNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 24),
            userNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            userNameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    //MARK: - Helper Methods
    func set(favorite: Follower) {
        avatarImageView.downloadImage(from: favorite.avatarUrl)
        userNameLabel.text = favorite.login
    }
}
