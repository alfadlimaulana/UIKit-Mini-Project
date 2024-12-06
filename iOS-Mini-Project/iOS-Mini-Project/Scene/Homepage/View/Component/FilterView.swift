//
//  FilterView.swift
//  iOS-Mini-Project
//
//  Created by Alfadli Maulana Siddik on 04/12/24.
//

import UIKit

class FilterView: UIScrollView {
    var areas: [String] = []
    var appliedFilters: [String] = []
    var onCategorySelected: ((String) -> Void)?
    
    let categoriesStack = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 8
        view.alignment = .fill
        return view
    }()
    
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
        
        self.addSubview(categoriesStack)
        
        categoriesStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoriesStack.topAnchor.constraint(equalTo: self.topAnchor),
            categoriesStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            categoriesStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            categoriesStack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func configure(areas: [String], appliedFilters: [String]) {
        self.appliedFilters = appliedFilters
        
        let appliedAreas = areas.filter { appliedFilters.contains($0) }
        let remainingAreas = areas.filter { !appliedFilters.contains($0) }

        // Gabungkan appliedAreas di depan dan remainingAreas disortir
        let sortedAreas = appliedAreas + remainingAreas.sorted()
        
        self.areas = sortedAreas
        
        categoriesStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for text in self.areas {
            let button = UIButton(type: .custom)
            var config = UIButton.Configuration.filled()
            config.title = text
            config.contentInsets = NSDirectionalEdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12)
            
            if appliedFilters.contains(text) {
                config.baseBackgroundColor = .systemBlue
                config.baseForegroundColor = .white
            } else {
                config.baseBackgroundColor = .gray
                config.baseForegroundColor = .black
            }
            
            config.cornerStyle = .capsule
            let attributedTitle = AttributedString(
                text,
                attributes: AttributeContainer([
                    .font: UIFont.systemFont(ofSize: 12, weight: .medium),
                    .foregroundColor: UIColor.white
                ])
            )
            config.attributedTitle = attributedTitle
            button.configuration = config
            
            categoriesStack.addArrangedSubview(button)
            
            button.addTarget(self, action: #selector(badgeTapped(_:)), for: .touchUpInside)
        }
    }

    @objc func badgeTapped(_ sender: UIButton) {
        if let buttonTitle = sender.configuration?.title {
            onCategorySelected?(buttonTitle)
        } else {
            print("Badge tapped, but title is unavailable.")
        }
    }
}
