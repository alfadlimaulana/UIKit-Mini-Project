//
//  MealServiceProtocol.swift
//  iOS-Mini-Project
//
//  Created by Alfadli Maulana Siddik on 08/12/24.
//

protocol MealServiceProtocol {
    func fetchMeals(with endpoint: Endpoint, completion: @escaping (Result<[Meal], MealServiceError>) -> Void)
}
