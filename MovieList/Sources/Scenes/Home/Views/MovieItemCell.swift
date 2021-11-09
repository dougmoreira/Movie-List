//
//  MovieItemCell.swift
//  MovieList
//
//  Created by douglas.fernandes on 06/11/21.
//

import UIKit

final class MovieItemCell: UICollectionViewCell {
    
    // MARK: - View Metrics
    
    private enum Constants {
        struct ViewMetrics {
            static let smallRadio: CGFloat = 6
            static let baseTitle: CGFloat = 24
        }
        
        struct Spaces {
            static let baseSpace: CGFloat = 24
        }
        
        struct Sizes {
            static let large: CGFloat = 128
        }
        
    }
        
    // MARK: - Components
    
    private let imageCard: CustomImageView = {
        let image = CustomImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = Constants.ViewMetrics.smallRadio
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: Constants.ViewMetrics.baseTitle)
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
            imageCard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Spaces.baseSpace),
            imageCard.heightAnchor.constraint(equalToConstant: Constants.Sizes.large),
            imageCard.widthAnchor.constraint(equalToConstant: Constants.Sizes.large)
        ])
    }
    
    private func constrainTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: imageCard.trailingAnchor, constant: Constants.Spaces.baseSpace),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.Spaces.baseSpace),
            titleLabel.heightAnchor.constraint(equalTo: heightAnchor, constant: Constants.Spaces.baseSpace)
        ])
        
    }
    
    private func setupCellStyle() {
        backgroundColor = .systemGray6
        layer.cornerRadius = Constants.ViewMetrics.smallRadio
    }
    
    // MARK: - Setup Cell
    
    public func setupCell(with viewData: MovieListModels.ViewData) {
        titleLabel.text = viewData.name
        imageCard.load(url: URL(string: viewData.urlImage)!)
        
    }

}
