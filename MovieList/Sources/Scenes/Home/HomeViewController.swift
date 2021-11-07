//
//  HomeViewController.swift
//  MovieList
//
//  Created by douglas.fernandes on 05/11/21.
//

import UIKit

protocol HomeDisplayLogic: NSObject {
    func displaySearchResult(_ viewData: [MovieListModels.ViewData])
}

final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    var contentView: HomeViewProtocol? {
        view as? HomeViewProtocol
    }
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationItem.title = "Movie List"
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
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchTerm = searchBar.text else { return }
        self.interactor.onDidType(searchTerm: searchTerm)
    }
    
}

extension HomeViewController: HomeDisplayLogic {
    func displaySearchResult(_ viewData: [MovieListModels.ViewData]) {
        DispatchQueue.main.async {
            self.contentView?.setupViewData(viewData)
        }
    }

}
