//
//  TitleText.swift
//  iOS-Mini-Project
//
//  Created by Alfadli Maulana Siddik on 06/12/24.
//

import UIKit

class Ingredients: UIView {
    private let titleView = {
        let vw = TitleText()
        vw.text = "Ingredients"
        return vw
    }()
    
    private let ingredientsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .leading
        return stackView
    }()
    
    var ingredients: [(String, String)] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    // Inisialisasi untuk Interface Builder
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        addSubview(titleView)
        addSubview(ingredientsStackView)
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: self.topAnchor),
            titleView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
        
        ingredientsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ingredientsStackView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 8),
            ingredientsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            ingredientsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            ingredientsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func configure(measures: [String], ingredients: [String]) {
        self.ingredients = zip(measures, ingredients).filter { !$0.0.isEmpty && !$0.1.isEmpty }
        titleView.configure(with: "Ingredients")
        
        ingredientsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for (measure, ingredient) in self.ingredients {
            let label = UILabel()
            label.text = "\(measure) of \(ingredient)"
            label.font = UIFont.systemFont(ofSize: 12)
            ingredientsStackView.addArrangedSubview(label)
        }
    }
}
