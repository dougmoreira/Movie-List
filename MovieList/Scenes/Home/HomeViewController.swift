//
//  HomeViewController.swift
//  MovieList
//
//  Created by douglas.fernandes on 05/11/21.
//

import UIKit

protocol HomeDisplayLogic: NSObject {
    func displaySearchResult()
}

final class HomeViewController: UIViewController {
    
    // - MARK: Components
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - Dependencies
    
    private let interactor: HomeBusinessLogic
    private let router: HomeRoutingLogic
    
    init(
        interactor: HomeBusinessLogic,
        router: HomeRoutingLogic
    ) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        
    }
    
    override func loadView() {
        super.loadView()
        view = HomeView(frame: view.frame)
    }
    
    // MARK: - Setup
    
    private func setupSearchController() {
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
}

extension HomeViewController: UISearchBarDelegate {
    
}

extension HomeViewController: HomeDisplayLogic {
    func displaySearchResult() {
        
    }
}
