//
//  MealService.swift
//  iOS-Mini-Project
//
//  Created by Alfadli Maulana Siddik on 05/12/24.
//

import Foundation

class MockMealService: MealServiceProtocol {
    var result: Result<[Meal], MealServiceError>?

    func fetchMeals(with endpoint: Endpoint, completion: @escaping (Result<[Meal], MealServiceError>) -> Void) {
        if let result = result {
            completion(result)
        } else {
            fatalError("Result is not set in MockMealService. Ensure `result` is set before calling `fetchMeals`.")
        }
    }
}
