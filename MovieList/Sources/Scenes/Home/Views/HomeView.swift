//
//  HomeView.swift
//  MovieList
//
//  Created by douglas.fernandes on 05/11/21.
//

import UIKit

protocol HomeViewProtocol: NSObject {
    func setupViewData(_ viewData: [MovieListModels.ViewData])
}

final class HomeView: UIView {
    
    // MARK: - Components
    
    private lazy var movieCollections: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: frame, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .black
        collection.register(MovieItemCell.self, forCellWithReuseIdentifier: Constants.movieCollectionCellId)
        collection.register(WelcomeCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constants.welcomeCellId)
        collection.backgroundColor = .systemGray2
        return collection
    }()
    
    // MARK: - Constants
    
    private enum Constants {
        static let movieCollectionCellId = "movieId"
        static let welcomeCellId = "headerId"
    }
    
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
        
    }
    
    private func addSubviews() {
        addSubview(movieCollections)
    }
    
    private func constrainMovieCollection() {
        NSLayoutConstraint.activate([
            movieCollections.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            movieCollections.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            movieCollections.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            movieCollections.bottomAnchor.constraint(equalTo: bottomAnchor)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.movieCollectionCellId, for: indexPath) as! MovieItemCell
        let cellViewData = collectionData[indexPath.item]
        cell.setupCell(with: cellViewData)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 400, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 24, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Constants.welcomeCellId, for: indexPath) as! WelcomeCell
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        guard collectionData.isEmpty else {
            return .init(width: frame.width, height: 0)
            
        }
        
        return .init(width: 0, height: 200)
        
    }
}

extension HomeView: HomeViewProtocol {
    func setupViewData(_ viewData: [MovieListModels.ViewData]) {
        collectionData = viewData
        movieCollections.reloadData()
    }

}
