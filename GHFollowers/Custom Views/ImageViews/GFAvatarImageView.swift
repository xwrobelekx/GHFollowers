//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by Kamil Wrobel on 2/27/20.
//  Copyright © 2020 Kamil Wrobel. All rights reserved.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    
    //MARK: - Properties
    let cache = NetworkManger.shared.cache
    let placeholderImage = Images.placeholder
    
    
    //MARK: - Intializers
    override init(frame: CGRect){
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Configure Method
    func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    //MARK: - Helper Method
    func downloadImage(from url: String) {
        NetworkManger.shared.downloadImages(from: url) { [weak self](image) in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
