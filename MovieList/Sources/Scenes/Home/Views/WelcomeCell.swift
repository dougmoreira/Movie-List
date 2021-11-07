//
//  WelcomeCell.swift
//  MovieList
//
//  Created by douglas.fernandes on 07/11/21.
//

import UIKit

final class WelcomeCell: UICollectionReusableView {
    
    // MARK: - ViewComponents
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Created by Douglas Moreira"
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray2
        addSubviews()
        constrainSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Coded View
    
    private func addSubviews() {
        addSubview(titleLabel)
    }
    
    private func constrainSubviews() {
        constrainTitleLabel()
    }
    
    private func constrainTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
