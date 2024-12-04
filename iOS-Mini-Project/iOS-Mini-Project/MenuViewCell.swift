//
//  MenuViewCell.swift
//  iOS-Mini-Project
//
//  Created by Alfadli Maulana Siddik on 04/12/24.
//

import UIKit

class MenuViewCell: UICollectionViewCell {
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let categoryLabel = UILabel()
    let cardBody = UIView()
    let badgeView = UIView()

    override init(frame: CGRect) {
       super.init(frame: frame)
       setupViews()
    }

    required init?(coder: NSCoder) {
       super.init(coder: coder)
       setupViews()
    }

    private func setupViews() {
       // Setup imageView
        contentView.backgroundColor = .white
        
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        cardBody.translatesAutoresizingMaskIntoConstraints = false

        // Setup titleLabel
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        // Setup subtitleLabel
        categoryLabel.font = UIFont.systemFont(ofSize: 10)
        categoryLabel.textColor = .white
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        badgeView.backgroundColor = .systemBlue
        badgeView.layer.cornerRadius = 12
        badgeView.layer.masksToBounds = true
        badgeView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add subviews to the contentView
        contentView.addSubview(imageView)
        contentView.addSubview(cardBody)
        cardBody.addSubview(titleLabel)
        cardBody.addSubview(badgeView)
        badgeView.addSubview(categoryLabel)
        

        // Layout subviews
        NSLayoutConstraint.activate([
           imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
           imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
           imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
           imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.75),
           
           cardBody.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
           cardBody.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
           cardBody.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
           cardBody.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
           
           badgeView.leadingAnchor.constraint(equalTo: cardBody.leadingAnchor),
           badgeView.bottomAnchor.constraint(equalTo: cardBody.bottomAnchor),
           
           categoryLabel.topAnchor.constraint(equalTo: badgeView.topAnchor, constant: 6),
           categoryLabel.bottomAnchor.constraint(equalTo: badgeView.bottomAnchor, constant: -6),
           categoryLabel.leadingAnchor.constraint(equalTo: badgeView.leadingAnchor, constant: 12),
           categoryLabel.trailingAnchor.constraint(equalTo: badgeView.trailingAnchor, constant: -12),
           
           titleLabel.bottomAnchor.constraint(equalTo: badgeView.topAnchor, constant: -4),
           titleLabel.leadingAnchor.constraint(equalTo: cardBody.leadingAnchor),
           titleLabel.trailingAnchor.constraint(equalTo: cardBody.trailingAnchor)
        ])
    }

    func configure(image: UIImage?, title: String, subtitle: String) {
        imageView.image = image
        titleLabel.text = title
        categoryLabel.text = subtitle
    }
}
