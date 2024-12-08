//
//  MealService.swift
//  iOS-Mini-Project
//
//  Created by Alfadli Maulana Siddik on 05/12/24.
//

import Foundation

class MealService: MealServiceProtocol {
    func fetchMeals(with endpoint: Endpoint, completion: @escaping (Result<[Meal], MealServiceError>) -> Void) {
        guard let request = endpoint.request else { return }
        
        
        URLSession.shared.dataTask(with: request) { data, resp, error in
            if let error = error {
                completion(.failure(.unknown(error.localizedDescription)))
                return
            }
            
            if let resp = resp as? HTTPURLResponse, resp.statusCode != 200 {
                completion(.failure(.serverError()))
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let mealData = try decoder.decode(Meals.self, from: data)
                    completion(.success(mealData.meals))
                    
                } catch let err {
                    completion(.failure(.decodingError()))
                    print(err.localizedDescription)
                }
                
            } else {
                completion(.failure(.unknown()))
            }
            
        }.resume()
    }
}
