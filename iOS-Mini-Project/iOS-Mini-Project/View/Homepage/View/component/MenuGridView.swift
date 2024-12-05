//
//  GridView.swift
//  iOS-Mini-Project
//
//  Created by Alfadli Maulana Siddik on 05/12/24.
//

import UIKit

class MenuGridView: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let collectionView: UICollectionView
    private let gridLayout: UICollectionViewFlowLayout
    
    var meals: [Meal] = []
    var didSelectItem: ((IndexPath) -> Void)?
    
    override init(frame: CGRect) {
        // Inisialisasi layout dan collection view
        gridLayout = UICollectionViewFlowLayout()
        gridLayout.scrollDirection = .vertical
        gridLayout.minimumLineSpacing = 8
        gridLayout.minimumInteritemSpacing = 8
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: gridLayout)
        super.init(frame: frame)
        
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        gridLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: gridLayout)
        super.init(coder: coder)
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MenuViewCell.self, forCellWithReuseIdentifier: "Menu")
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            didSelectItem?(indexPath)
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Menu", for: indexPath) as? MenuViewCell else {
            return UICollectionViewCell()
        }
        
        let meal = self.meals[indexPath.row]
        cell.configure(meal: meal)
        
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
    
    // MARK: - Public Method
    
    func configure(meals: [Meal], didSelectItem: @escaping (IndexPath) -> Void) {
        self.meals = meals
        self.didSelectItem = didSelectItem
        collectionView.reloadData()
    }
}

