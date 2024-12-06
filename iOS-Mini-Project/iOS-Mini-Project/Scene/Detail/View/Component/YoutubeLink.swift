//
//  TitleText.swift
//  iOS-Mini-Project
//
//  Created by Alfadli Maulana Siddik on 06/12/24.
//

import UIKit

class YoutubeLink: UIStackView {
    private let titleView = TitleText()
    private let youtubeBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "play.rectangle.fill"), for: .normal)
        btn.tintColor = .red
        
        return btn
    }()
    
    private var youtubeLink: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.axis = .horizontal
        self.spacing = 8
        self.alignment = .leading
        
        self.addArrangedSubview(titleView)
        self.addArrangedSubview(youtubeBtn)
    }
    
    func configure(link: String) {
        self.youtubeLink = link
        titleView.configure(with: "Available on Youtube")
        youtubeBtn.addTarget(self, action: #selector(youtubeButtonTapped), for: .touchUpInside)
    }
    
    @objc func youtubeButtonTapped() {
        guard let youtubeLink else { return }
        
        if let url = URL(string: youtubeLink) {
            UIApplication.shared.open(url)
        }
    }
}
