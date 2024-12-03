//
//  ViewController.swift
//  iOS-Mini-Project
//
//  Created by Alfadli Maulana Siddik on 03/12/24.
//

import UIKit

class HomepageViewController: UIViewController {
    let textView = UITextView()
    let container = UIStackView(arrangedSubviews: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemBackground
        title = "Choose Your Menu"
        
        view.addSubview(container)
        setupContainer()
        
        container.addArrangedSubview(textView)
        setupSearchInput()
    }
    
    func setupContainer () {
        container.axis = .vertical
        container.alignment = .center
        container.spacing = 20
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .green
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            container.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func setupSearchInput() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Enter detailed information..."
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
            textView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: container.trailingAnchor)
        ])
    }

    @objc func navigateToDetail() {
        let detailPage = DetailViewController()
        navigationController?.pushViewController(detailPage, animated: true)
    }
}

