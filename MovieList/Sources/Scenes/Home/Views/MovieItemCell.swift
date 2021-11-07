//
//  MovieItemCell.swift
//  MovieList
//
//  Created by douglas.fernandes on 06/11/21.
//

import UIKit

final class MovieItemCell: UICollectionViewCell {
        
    // MARK: - Components
    
    private let imageCard: CustomImageView = {
        let image = CustomImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 24)
        label.numberOfLines = .zero
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        constrainSubviews()
        setupCellStyle()
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
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            titleLabel.heightAnchor.constraint(equalTo: heightAnchor, constant: 24)
        ])
        
    }
    
    private func setupCellStyle() {
        backgroundColor = .systemGray6
        layer.cornerRadius = 6
    }
    
    // MARK: - Setup Cell
    
    public func setupCell(with viewData: MovieListModels.ViewData) {
        titleLabel.text = viewData.name
        imageCard.load(url: URL(string: viewData.urlImage)!)
        
    }

}
