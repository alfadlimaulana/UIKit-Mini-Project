//
//  Meal.swift
//  iOS-Mini-Project
//
//  Created by Alfadli Maulana Siddik on 05/12/24.
//

import Foundation

struct Meals: Decodable {
    let meals: [Meal]
}

struct Meal: Decodable, Equatable {
    let idMeal: String
    let strMeal: String
    let strDrinkAlternate: String?
    let strCategory: String
    let strArea: String
    let strInstructions: String
    let strMealThumb: String
    let strTags: String?
    let strYoutube: String
    let strSource: String?
    let strImageSource: String?
    let strCreativeCommonsConfirmed: String?
    let dateModified: String?
    
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    
    var ingredients: [String] {
        let ingredientKeys: [String?] = [
            strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6,
            strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12,
            strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18,
            strIngredient19, strIngredient20
        ]
        return ingredientKeys.compactMap { $0 }.filter { !$0.isEmpty }
    }

    var measures: [String] {
        let measureKeys: [String?] = [
            strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6,
            strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12,
            strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18,
            strMeasure19, strMeasure20
        ]
        return measureKeys.compactMap { $0 }.filter { !$0.isEmpty }
    }
}

extension Meal {
    static let dummyData = [
        Meal(
            idMeal: "12345",
            strMeal: "Chicken Curry",
            strDrinkAlternate: nil,
            strCategory: "Main Course",
            strArea: "Indian",
            strInstructions: "Heat oil in a pan, add spices and cook the chicken until tender. Serve hot.",
            strMealThumb: "https://example.com/images/chicken-curry.jpg",
            strTags: "Spicy, Dinner",
            strYoutube: "https://www.youtube.com/watch?v=dummyvideo",
            strSource: "https://example.com/recipes/chicken-curry",
            strImageSource: nil,
            strCreativeCommonsConfirmed: nil,
            dateModified: "2024-12-08",
            strIngredient1: "Chicken",
            strIngredient2: "Curry Powder",
            strIngredient3: "Coconut Milk",
            strIngredient4: "Garlic",
            strIngredient5: "Onion",
            strIngredient6: "Tomatoes",
            strIngredient7: "Salt",
            strIngredient8: "Pepper",
            strIngredient9: nil,
            strIngredient10: nil,
            strIngredient11: nil,
            strIngredient12: nil,
            strIngredient13: nil,
            strIngredient14: nil,
            strIngredient15: nil,
            strIngredient16: nil,
            strIngredient17: nil,
            strIngredient18: nil,
            strIngredient19: nil,
            strIngredient20: nil,
            strMeasure1: "500g",
            strMeasure2: "2 tbsp",
            strMeasure3: "1 cup",
            strMeasure4: "3 cloves",
            strMeasure5: "1 large",
            strMeasure6: "2 medium",
            strMeasure7: "To taste",
            strMeasure8: "To taste",
            strMeasure9: nil,
            strMeasure10: nil,
            strMeasure11: nil,
            strMeasure12: nil,
            strMeasure13: nil,
            strMeasure14: nil,
            strMeasure15: nil,
            strMeasure16: nil,
            strMeasure17: nil,
            strMeasure18: nil,
            strMeasure19: nil,
            strMeasure20: nil
        ),
        Meal(
            idMeal: "67890",
            strMeal: "Beef Stroganoff",
            strDrinkAlternate: nil,
            strCategory: "Main Course",
            strArea: "Russian",
            strInstructions: "Cook beef strips with mushrooms and onions. Add sour cream and serve over noodles.",
            strMealThumb: "https://example.com/images/beef-stroganoff.jpg",
            strTags: "Comfort Food, Dinner",
            strYoutube: "https://www.youtube.com/watch?v=dummyvideobeef",
            strSource: "https://example.com/recipes/beef-stroganoff",
            strImageSource: nil,
            strCreativeCommonsConfirmed: nil,
            dateModified: "2024-12-01",
            strIngredient1: "Beef Strips",
            strIngredient2: "Mushrooms",
            strIngredient3: "Onions",
            strIngredient4: "Sour Cream",
            strIngredient5: "Butter",
            strIngredient6: "Flour",
            strIngredient7: "Beef Stock",
            strIngredient8: "Salt",
            strIngredient9: "Pepper",
            strIngredient10: "Egg Noodles",
            strIngredient11: nil,
            strIngredient12: nil,
            strIngredient13: nil,
            strIngredient14: nil,
            strIngredient15: nil,
            strIngredient16: nil,
            strIngredient17: nil,
            strIngredient18: nil,
            strIngredient19: nil,
            strIngredient20: nil,
            strMeasure1: "300g",
            strMeasure2: "1 cup",
            strMeasure3: "1 medium",
            strMeasure4: "1/2 cup",
            strMeasure5: "2 tbsp",
            strMeasure6: "1 tbsp",
            strMeasure7: "1 cup",
            strMeasure8: "To taste",
            strMeasure9: "To taste",
            strMeasure10: "200g",
            strMeasure11: nil,
            strMeasure12: nil,
            strMeasure13: nil,
            strMeasure14: nil,
            strMeasure15: nil,
            strMeasure16: nil,
            strMeasure17: nil,
            strMeasure18: nil,
            strMeasure19: nil,
            strMeasure20: nil
        )
    ]
}
