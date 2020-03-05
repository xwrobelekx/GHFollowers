//
//  FavloritesVC.swift
//  GHFollowers
//
//  Created by Kamil Wrobel on 2/19/20.
//  Copyright © 2020 Kamil Wrobel. All rights reserved.
//

import UIKit

class FavloritesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue
        
        PersistanceManager.retriveFavorites { result in
            switch result {
            case .success(let favorites):
                print(favorites)
            case .failure(let error):
                break
            }
        }
    }
    


}
