//
//  ViewController.swift
//  iOS-Mini-Project
//
//  Created by Alfadli Maulana Siddik on 03/12/24.
//

import UIKit

class HomepageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let searchController = UISearchController(searchResultsController: nil)
    let containerView = UIView()
    let filterView = UIScrollView()
    let gridLayout = UICollectionViewFlowLayout()
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .secondarySystemBackground
        
        title = "Choose Your Menu"
        
        setupContainer()
        setupSearchInput()
        setupFilterView()
        setupGrid()
    }
    
    func setupContainer () {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    func setupSearchInput() {
        searchController.searchBar.placeholder = "Search something..."
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func setupFilterView() {
        filterView.translatesAutoresizingMaskIntoConstraints = false
        filterView.showsHorizontalScrollIndicator = false
        
        let categoriesStack = UIStackView(arrangedSubviews: [])
        categoriesStack.axis = .horizontal
        categoriesStack.spacing = 8
        categoriesStack.alignment = .fill
        categoriesStack.translatesAutoresizingMaskIntoConstraints = false
        
        let categories = ["Indian", "Chinese", "Japanese", "French", "Moroccan", "Indonesia"]
        
        for text in categories {
            let badgeView = UIView()
            badgeView.backgroundColor = .systemBlue
            badgeView.layer.cornerRadius = 12
            badgeView.layer.masksToBounds = true
            badgeView.translatesAutoresizingMaskIntoConstraints = false
            
            let label = UILabel()
            label.text = text
            label.font = UIFont.systemFont(ofSize: 12)
            label.textColor = .white
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            
            badgeView.addSubview(label)
            
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: badgeView.topAnchor, constant: 6),
                label.bottomAnchor.constraint(equalTo: badgeView.bottomAnchor, constant: -6),
                label.leadingAnchor.constraint(equalTo: badgeView.leadingAnchor, constant: 12),
                label.trailingAnchor.constraint(equalTo: badgeView.trailingAnchor, constant: -12)
            ])
            
            // Add the label to the stack view
            categoriesStack.addArrangedSubview(badgeView)
        }
        
        containerView.addSubview(filterView)
        filterView.addSubview(categoriesStack)
        
        NSLayoutConstraint.activate([
            filterView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            filterView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            filterView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            filterView.heightAnchor.constraint(equalToConstant: 28),
            
            categoriesStack.topAnchor.constraint(equalTo: filterView.topAnchor),
            categoriesStack.leadingAnchor.constraint(equalTo: filterView.leadingAnchor),
            categoriesStack.trailingAnchor.constraint(equalTo: filterView.trailingAnchor),
            categoriesStack.bottomAnchor.constraint(equalTo: filterView.bottomAnchor)
        ])
    }
    
    func setupGrid() {
        gridLayout.scrollDirection = .vertical
        gridLayout.minimumLineSpacing = 8 // Jarak antar baris
        gridLayout.minimumInteritemSpacing = 8 // Jarak antar item
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: gridLayout)
        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MenuViewCell.self, forCellWithReuseIdentifier: "Menu")
        
        containerView.addSubview(collectionView)
        
        // Auto Layout untuk Collection View
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: filterView.bottomAnchor, constant: 16),
            collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
    }
    
    @objc func navigateToDetail() {
        let detailPage = DetailViewController()
        navigationController?.pushViewController(detailPage, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Menu", for: indexPath) as? MenuViewCell else {
            return UICollectionViewCell()
        }
        
        // Contoh data (Anda bisa mengganti dengan data dari model)
        let sampleImage = UIImage(systemName: "photo") // Pastikan Anda memiliki gambar "sample" di asset
        let title = "Title \(indexPath.item + 1)"
        let subtitle = "Subtitle \(indexPath.item + 1)"
        
        // Configure the cell
        cell.configure(image: sampleImage, title: title, subtitle: subtitle)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 2
        let totalSpacing = (itemsPerRow - 1) * 8
        let width = (collectionView.frame.width - totalSpacing) / itemsPerRow
        let height = UIScreen.main.bounds.height * 0.3
        
        return CGSize(width: width, height: height)
    }
}

extension HomepageViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        print("User is searching for: \(searchText)")
    }
}
