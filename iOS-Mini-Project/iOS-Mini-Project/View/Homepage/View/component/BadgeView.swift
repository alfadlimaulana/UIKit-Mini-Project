//
//  BadgeView.swift
//  iOS-Mini-Project
//
//  Created by Alfadli Maulana Siddik on 04/12/24.
//

import UIKit

class BadgeView: UIView {
    let label = UILabel()
    
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
        self.backgroundColor = .systemBlue
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 6),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12)
        ])
    }
    
    func configure(with text: String) {
        label.text = text
    }
}
