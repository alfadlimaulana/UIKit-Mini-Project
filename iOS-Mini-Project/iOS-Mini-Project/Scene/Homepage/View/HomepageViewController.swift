//
//  ViewController.swift
//  iOS-Mini-Project
//
//  Created by Alfadli Maulana Siddik on 03/12/24.
//

import UIKit

class HomepageViewController: UIViewController {
    let searchController = UISearchController(searchResultsController: nil)
    let containerView = UIView()
    let filterView = FilterView()
    let gridView = MenuGridView()
    
    let vm: HomepageViewControllerViewModel
    
    init(vm: HomepageViewControllerViewModel = HomepageViewControllerViewModel()) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .secondarySystemBackground
        
        title = "Choose Your Menu"
        
        setupContainer()
        setupSearchInput()
        setupFilterView()
        setupGrid()
        
        self.vm.onMealsUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.gridView.reloadData(meals: self?.vm.meals ?? [])
            }
        }
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
        containerView.addSubview(filterView)
        NSLayoutConstraint.activate([
            filterView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            filterView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            filterView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            filterView.heightAnchor.constraint(equalToConstant: 28),
        ])
    }
    
    func setupGrid() {
        containerView.addSubview(gridView)
        gridView.translatesAutoresizingMaskIntoConstraints = false
        
        // Auto Layout untuk GridView
        NSLayoutConstraint.activate([
            gridView.topAnchor.constraint(equalTo: filterView.bottomAnchor, constant: 16),
            gridView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            gridView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            gridView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        
        gridView.configure(meals: vm.meals) { [weak self] indexPath in
            
            guard let self = self else { return }
            let meal = self.vm.meals[indexPath.row]
            let vm = DetailViewControllerViewModel(meal: meal)
            let vc = DetailViewController(vm: vm)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension HomepageViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        print("User is searching for: \(searchText)")
    }
}