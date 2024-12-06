//
//  DetailViewModel.swift
//  iOS-Mini-Project
//
//  Created by Alfadli Maulana Siddik on 05/12/24.
//

import Foundation

class HomepageViewControllerViewModel {
    var onMealsUpdated: (()->Void)?
    var onErrorMessage: ((MealServiceError)->Void)?
    
    private(set) var meals: [Meal] = [] {
        didSet {
            self.onMealsUpdated?()
        }
    }
    
    init() {
        self.fetchMeals()
    }
    
    public func fetchMeals(query: String? = "") {
        let endpoint = Endpoint.fetchMeals(query: query)
        MealService.fetchMeals(with: endpoint) { [weak self] result in
            switch result {
            case .success(let meals):
                self?.meals = meals
                print("DEBUG PRINT:", "\(meals.count) coins fetched.")
                
            case .failure(let error):
                self?.onErrorMessage?(error)
            }
        }
        
    }
}
