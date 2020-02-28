 //
//  FollowerLiseVC.swift
//  GHFollowers
//
//  Created by Kamil Wrobel on 2/20/20.
//  Copyright © 2020 Kamil Wrobel. All rights reserved.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var userName: String!


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true

        NetworkManger.shared.getFollowers(for: userName, page: 1) { result in
            switch result {
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happened", message: error.rawValue, buttonTitle: "OK")

            case .success(let followers):
                print("Followers.count: \(followers.count)")
                print(followers)
            }
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)

    }
    


}
