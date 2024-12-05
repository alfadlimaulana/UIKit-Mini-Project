//
//  MenuViewCell.swift
//  iOS-Mini-Project
//
//  Created by Alfadli Maulana Siddik on 04/12/24.
//

import UIKit

class MenuViewCell: UICollectionViewCell {
    var meal: Meal!
    
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let cardBody = UIView()
    let badgeView = BadgeView()

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
        contentView.layer.cornerRadius = 8
        
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.image = UIImage(systemName: "image")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        cardBody.translatesAutoresizingMaskIntoConstraints = false

        // Setup titleLabel
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add subviews to the contentView
        contentView.addSubview(imageView)
        contentView.addSubview(cardBody)
        cardBody.addSubview(titleLabel)
        cardBody.addSubview(badgeView)
        

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
           
           titleLabel.bottomAnchor.constraint(equalTo: badgeView.topAnchor, constant: -6),
           titleLabel.leadingAnchor.constraint(equalTo: cardBody.leadingAnchor),
           titleLabel.trailingAnchor.constraint(equalTo: cardBody.trailingAnchor)
        ])
    }

    func configure(meal: Meal) {
        self.meal = meal
        
        if let url = URL(string: meal.strMealThumb) {
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                guard let self = self else { return }
                
                if let error = error {
                    print("Error fetching image: \(error.localizedDescription)")
                    return
                }
                
                if let data = data, let image = UIImage(data: data) {
                    // Perbarui UI di thread utama
                    DispatchQueue.main.async {
                        self.imageView.image = image
                    }
                }
            }
            task.resume()
        }
        
        titleLabel.text = meal.strMeal
        badgeView.configure(with: meal.strArea)
    }
}
