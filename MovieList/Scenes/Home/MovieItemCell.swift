//
//  MovieItemCell.swift
//  MovieList
//
//  Created by douglas.fernandes on 06/11/21.
//

import UIKit

final class MovieItemCell: UICollectionViewCell {
    
    // MARK: - Components
    
    private let imageCard: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .green
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Harry Potter"
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemPink
        
        addSubViews()
        constrainSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - CodedView
    
    private func addSubViews() {
        addSubview(imageCard)
        addSubview(titleLabel)
    }
    
    private func constrainSubviews() {
        constrainImageCard()
        constrainTitleLabel()
    }
    
    private func constrainImageCard() {
        NSLayoutConstraint.activate([
            imageCard.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageCard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            imageCard.heightAnchor.constraint(equalToConstant: 128),
            imageCard.widthAnchor.constraint(equalToConstant: 128)
        ])
    }
    
    private func constrainTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: imageCard.trailingAnchor, constant: 24),
            titleLabel.heightAnchor.constraint(equalTo: heightAnchor, constant: 24)
        ])
        
    }

}
