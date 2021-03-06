 //
 //  FollowerLiseVC.swift
 //  GHFollowers
 //
 //  Created by Kamil Wrobel on 2/20/20.
 //  Copyright © 2020 Kamil Wrobel. All rights reserved.
 //
 
 import UIKit
 
 
 class FollowerListVC: GFDataLoadingVC {
    
    //MARK: - Types
    enum Section {
        case main
    }
    
    
    //MARK: - Properties
    var userName: String!
    var followers: [Follower] = []
    var filteredFollowers : [Follower] = []
    var page: Int = 1
    var hasMoreFollowers = true
    var isSearching = false
    var isLoadingMoreFolowers = false
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    
    //MARK: - Initializers
    init(username: String) {
        super.init(nibName: nil, bundle: nil)
        self.userName = username
        title = userName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureSearchController()
        configureCollectionView()
        getFollowers(userName: userName, page: page)
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    
    //MARK: - Configure Methods
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowersCell.self, forCellWithReuseIdentifier: FollowersCell.reuseID)
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowersCell.reuseID, for: indexPath) as! FollowersCell
            cell.set(follower: follower)
            return cell
        })
    }
    
    func configureSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search for a username"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
    func updateData(on followers: [Follower]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
    
    //MARK: - Helper Methods
    func getFollowers(userName: String, page: Int) {
        showLodingView()
        isLoadingMoreFolowers = true
        
        NetworkManger.shared.getFollowers(for: userName, page: page) { [weak self] result in
            guard let self = self else {return}
            self.dismissLoadingView()
            
            switch result {
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happened", message: error.rawValue, buttonTitle: "OK")
            case .success(let followers):
                self.updateUI(with: followers)
            }
            self.isLoadingMoreFolowers = false
        }
    }
    
    func updateUI(with followers: [Follower]) {
        if followers.count < 100 {self.hasMoreFollowers = false}
        self.followers.append(contentsOf: followers)
        if self.followers.isEmpty {
            let message = "This user doesnt have any followers. Go follow them 😎."
            DispatchQueue.main.async {
                self.showEmptyStateView(with: message, in: self.view)
                return
            }
        }
        self.updateData(on: self.followers)
    }
    
    func addUserToFavorites(user: User) {
        let favorite = Follower(login: user.login, avatarUrl: user.avatarUrl)
        
        PersistanceManager.updateWith(favorite: favorite, actionType: .add) { [weak self] error in
            guard let self = self else { return }
            guard let error = error else {
                self.presentGFAlertOnMainThread(title: "Succes", message: "You have succesfully favorited this user", buttonTitle: "Great")
                return
            }
            self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")
        }
    }
    
    
    //MARK: - Target Action Methods
    @objc func addButtonTapped() {
        print("elo elo added")
        showLodingView()
        
        NetworkManger.shared.getUserInfo(for: userName) { [weak self] result in
            guard let self = self else {return}
            self.dismissLoadingView()
            
            switch result {
            case .success(let user):
                self.addUserToFavorites(user: user)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
 }
 
 
 //MARK: - Collection View Delegate
 extension FollowerListVC: UICollectionViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard hasMoreFollowers, !isLoadingMoreFolowers else {return}
            page += 1
            getFollowers(userName: userName, page: page)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let activeArray = isSearching ? filteredFollowers : followers
        let follower = activeArray[indexPath.item]
        
        let destinationcVC = UserInfoVC()
        destinationcVC.username = follower.login
        destinationcVC.delegate = self
        let navController = UINavigationController(rootViewController: destinationcVC)
        present(navController, animated: true)
    }
 }
 
 
 
 //MARK: - Search Field Methods
 extension FollowerListVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else {
            filteredFollowers.removeAll()
            updateData(on: followers)
            isSearching = false
            return
        }
        isSearching = true
        filteredFollowers = followers.filter { $0.login.lowercased().contains(filter.lowercased())}
        updateData(on: filteredFollowers)
    }
 }
 
 
 //MARK: - User Info Delegate Conformance
 extension FollowerListVC: UserInfoVCDelegate {
    
    func didRequestFollowers(for username: String) {
        // get followers for selected user
        self.userName = username
        title = userName
        page = 1
        followers.removeAll()
        filteredFollowers.removeAll()
        collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
        getFollowers(userName: username, page: page)
    }
 }
