//
//  TitleText.swift
//  iOS-Mini-Project
//
//  Created by Alfadli Maulana Siddik on 06/12/24.
//

import UIKit

class Instructions: UIView {
    private let titleView = TitleText()
    
    let labelView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
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
    
    private func setupView() {
        addSubview(titleView)
        addSubview(labelView)
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: self.topAnchor),
            titleView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
        
        labelView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 8),
            labelView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            labelView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            labelView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func configure(instructions: String) {
        titleView.configure(with: "Instructions")
        labelView.text = instructions
    }
}
