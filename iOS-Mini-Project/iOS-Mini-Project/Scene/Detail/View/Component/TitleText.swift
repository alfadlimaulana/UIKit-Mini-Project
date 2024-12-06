//
//  TitleText.swift
//  iOS-Mini-Project
//
//  Created by Alfadli Maulana Siddik on 06/12/24.
//

import UIKit

class TitleText: UILabel {
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
        self.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        self.textColor = .black
        self.textAlignment = .center
    }
    
    func configure(with text: String) {
        self.text = text
    }
}
