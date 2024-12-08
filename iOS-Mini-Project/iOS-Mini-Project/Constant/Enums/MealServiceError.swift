//
//  MealServiceError.swift
//  iOS-Mini-Project
//
//  Created by Alfadli Maulana Siddik on 08/12/24.
//

enum MealServiceError: Error {
    case serverError(String = "Server error occurred.")
    case unknown(String = "An unknown error occurred.")
    case decodingError(String = "Error parsing server response.")
}
