//
//  DetailViewModel.swift
//  iOS-Mini-Project
//
//  Created by Alfadli Maulana Siddik on 05/12/24.
//

import Foundation

class HomepageViewControllerViewModel {
    private let mealService: MealServiceProtocol
    var onMealsUpdated: (()->Void)?
    var onErrorMessage: ((MealServiceError)->Void)?
    
    private(set) var meals: [Meal] = []
    
    var filters: [String] = []
    
    var areas: [String] {
        Array(Set(self.meals.map(\.strArea)))
    }
    
    var filteredMeals: [Meal] = [] {
        didSet {
            self.onMealsUpdated?()
        }
    }
    
    init(mealService: MealServiceProtocol = MealService()) {
        self.mealService = mealService
    }
    
    public func fetchMeals(query: String? = "") {
        let endpoint = Endpoint.fetchMeals(query: query)
        mealService.fetchMeals(with: endpoint) { [weak self] result in
            switch result {
            case .success(let meals):
                self?.meals = meals
                self?.updateFilteredMeals()
                print("DEBUG PRINT:", "\(meals.count) coins fetched.")
                
            case .failure(let error):
                self?.onErrorMessage?(error)
            }
        }
    }
    
    func updateFilteredMeals() {
        if filters.isEmpty {
            filteredMeals = meals  // Jika filters kosong, tampilkan semua meals
        } else {
            filteredMeals = meals.filter { meal in
                filters.contains { filter in
                    meal.strArea.lowercased().contains(filter.lowercased())
                }
            }
        }
    }
    
    func updateFilters(newFilters: [String]) {
        filters = newFilters
        updateFilteredMeals()
    }
}
