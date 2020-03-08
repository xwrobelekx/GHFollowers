//
//  GFUserInfoHeaderVC.swift
//  GHFollowers
//
//  Created by Kamil Wrobel on 3/1/20.
//  Copyright © 2020 Kamil Wrobel. All rights reserved.
//

import UIKit

class GFUserInfoHeaderVC: UIViewController {
    
    
    //MARK: - Properties
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLAbel = GFTitleLabel(textAlligment: .left, fontSize: 34)
    let nameLAbel = GFSecondaryTitleLabel(fontSize: 18)
    let locationImageView = UIImageView()
    let locationLabel = GFSecondaryTitleLabel(fontSize: 18)
    let bioLabel = GFBodyLabel(textAlligment: .left)
    
    var user: User!
    
    
    //MARK: - Initalizers
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Properties
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(avatarImageView, usernameLAbel, nameLAbel, locationLabel, locationImageView, bioLabel)
        layoutUI()
        configureUIElements()
    }
    
    
    //MARK: - Configure Methods
    func configureUIElements() {
        avatarImageView.downloadImage(from: user.avatarUrl)
        usernameLAbel.text = user.login
        nameLAbel.text = user.name ?? ""
        locationLabel.text = user.location ?? "No Location"
        bioLabel.text = user.bio ?? "No bio avaliable"
        bioLabel.numberOfLines = 3
        locationImageView.image = SFSymbols.location
        locationImageView.tintColor = .secondaryLabel
    }
    
    
    func layoutUI() {
        let padding: CGFloat = 20
        let textImagePadding: CGFloat = 12
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 90),
            avatarImageView.heightAnchor.constraint(equalToConstant: 90),
            
            usernameLAbel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            usernameLAbel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            usernameLAbel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            usernameLAbel.heightAnchor.constraint(equalToConstant: 38),
            
            nameLAbel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: 8),
            nameLAbel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            nameLAbel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameLAbel.heightAnchor.constraint(equalToConstant: 20),
            
            locationImageView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            locationImageView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            locationImageView.widthAnchor.constraint(equalToConstant: 20),
            locationImageView.heightAnchor.constraint(equalToConstant: 20),
            
            locationLabel.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            bioLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: textImagePadding),
            bioLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bioLabel.heightAnchor.constraint(equalToConstant: 90)
            
        ])
    }
}
