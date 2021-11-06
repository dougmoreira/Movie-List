//
//  HomeView.swift
//  MovieList
//
//  Created by douglas.fernandes on 05/11/21.
//

import UIKit

final class HomeView: UIView {
    
    // MARK: - Components
    
    private lazy var movieCollections: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: frame, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .yellow
        collection.delegate = self
        collection.dataSource = self
        collection.register(MovieItemCell.self, forCellWithReuseIdentifier: Constants.movieCollectionCellId)
        return collection
    }()
    
    // MARK: - Constants
    
    private enum Constants {
        static let movieCollectionCellId = "movieId"
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        constrainSubviews()
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
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 400, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 24, left: 0, bottom: 0, right: 0)
    }
}
