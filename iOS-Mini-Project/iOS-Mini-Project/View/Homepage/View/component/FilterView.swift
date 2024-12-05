//
//  FilterView.swift
//  iOS-Mini-Project
//
//  Created by Alfadli Maulana Siddik on 04/12/24.
//

import UIKit

class FilterView: UIScrollView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    // Inisialisasi untuk Interface Builder
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.showsHorizontalScrollIndicator = false
        
        let categoriesStack = UIStackView(arrangedSubviews: [])
        categoriesStack.axis = .horizontal
        categoriesStack.spacing = 8
        categoriesStack.alignment = .fill
        categoriesStack.translatesAutoresizingMaskIntoConstraints = false
        
        let categories = ["Indian", "Chinese", "Japanese", "French", "Moroccan", "Indonesia"]
        
        for text in categories {
            let badge = BadgeView()
            badge.configure(with: text)
            
            // Add the label to the stack view
            categoriesStack.addArrangedSubview(badge)
        }
        
        self.addSubview(categoriesStack)
        
        NSLayoutConstraint.activate([
            categoriesStack.topAnchor.constraint(equalTo: self.topAnchor),
            categoriesStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            categoriesStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            categoriesStack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

}
