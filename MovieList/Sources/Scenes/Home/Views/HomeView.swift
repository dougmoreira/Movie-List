//
//  HomeView.swift
//  MovieList
//
//  Created by douglas.fernandes on 05/11/21.
//

import UIKit

protocol HomeViewProtocol: NSObject {
    func setupViewData(_ viewData: [MovieListModels.ViewData])
    func isLoading(_: Bool)
}

final class HomeView: UIView {
    
    // MARK: - View Metrics
    
    private enum Constants {
        struct Spaces {
            static let base: CGFloat = 24
            static let medium: CGFloat = 16
            static let large: CGFloat = 32
        }
        
        struct Sizes {
            static let navigationBarPadding: CGFloat = 250
            static let cellHeight: CGFloat = 200
            static let cardSize: CGFloat = 64
        }
        
        struct Keys {
            static let movieCollectionCellId = "movieId"
            static let welcomeCellId = "headerId"
        }
        
    }
    
        
    // MARK: - Components
    
    private lazy var movieCollections: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: frame, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.register(MovieItemCell.self, forCellWithReuseIdentifier: Constants.Keys.movieCollectionCellId)
        collection.register(WelcomeCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constants.Keys.welcomeCellId)
        collection.backgroundColor = .systemGray2
        return collection
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.style = .large
        activityIndicator.hidesWhenStopped = true
        activityIndicator.backgroundColor = .systemGray2
        return activityIndicator
    }()
    
    // MARK: - Properties
    
    private var collectionData: [MovieListModels.ViewData] = []
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        constrainSubviews()
        backgroundColor = .systemGray3
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Coded View
    
    private func constrainSubviews() {
        constrainMovieCollection()
        constrainActivityIndicator()
        
    }
    
    private func addSubviews() {
        addSubview(movieCollections)
        addSubview(activityIndicator)

    }
    
    private func constrainMovieCollection() {
        NSLayoutConstraint.activate([
            movieCollections.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            movieCollections.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            movieCollections.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            movieCollections.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func constrainActivityIndicator() {
        NSLayoutConstraint.activate([
            activityIndicator.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            activityIndicator.leadingAnchor.constraint(equalTo: leadingAnchor),
            activityIndicator.trailingAnchor.constraint(equalTo: trailingAnchor),
            activityIndicator.bottomAnchor.constraint(equalTo: bottomAnchor),
            activityIndicator.heightAnchor.constraint(equalToConstant: Constants.Sizes.cardSize),
            activityIndicator.widthAnchor.constraint(equalToConstant: Constants.Sizes.cardSize)
        ])
    
    }
    
}

extension HomeView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }
}

extension HomeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Keys.movieCollectionCellId, for: indexPath) as! MovieItemCell
        let cellViewData = collectionData[indexPath.item]
        cell.setupCell(with: cellViewData)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: frame.width - Constants.Spaces.large, height: Constants.Sizes.cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: Constants.Spaces.base, left: Constants.Spaces.medium, bottom: Constants.Spaces.medium, right: Constants.Spaces.medium)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Constants.Keys.welcomeCellId, for: indexPath) as! WelcomeCell
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        guard collectionData.isEmpty else {
            return .init()
            
        }
                
        return .init(width: frame.width, height: frame.height - Constants.Sizes.navigationBarPadding)
        
    }
}

extension HomeView: HomeViewProtocol {
    func isLoading(_ loading: Bool) {
        if loading {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
            
        }
        
    }
    
    func setupViewData(_ viewData: [MovieListModels.ViewData]) {
        collectionData = viewData
        movieCollections.reloadData()
        activityIndicator.stopAnimating()
    }

}
