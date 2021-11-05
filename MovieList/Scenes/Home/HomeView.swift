//
//  HomeView.swift
//  MovieList
//
//  Created by douglas.fernandes on 05/11/21.
//

import UIKit

final class HomeView: UIView {
    
    // MARK: - Components
    
    lazy var movieCollections: UICollectionView = {
        let layout = UICollectionViewLayout()
        let collection = UICollectionView(frame: frame, collectionViewLayout: layout)
        collection.backgroundColor = .yellow
        return collection
    }()
    
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
        constrainScroolView()
        
    }
    
    private func addSubviews() {
        addSubview(movieCollections)
    }
    
    private func constrainScroolView() {
        NSLayoutConstraint.activate([
            movieCollections.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            movieCollections.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            movieCollections.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            movieCollections.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
