//
//  iOS_Mini_ProjectTests.swift
//  iOS-Mini-ProjectTests
//
//  Created by Alfadli Maulana Siddik on 03/12/24.
//

import XCTest
@testable import iOS_Mini_Project

final class MealServiceTest: XCTestCase {
    var viewModel: HomepageViewControllerViewModel!
    var mockMealService: MockMealService!
    
    override func setUp() {
        super.setUp()
        mockMealService = MockMealService()
        viewModel = HomepageViewControllerViewModel(mealService: mockMealService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockMealService = nil
        super.tearDown()
    }
    
    func testFetchMealsSuccess() {
        // Arrange
        let mockMeals = Meal.dummyData
        mockMealService.result = .success(mockMeals)
        let expectation = self.expectation(description: "Meals fetched")
        
        viewModel.onErrorMessage = { _ in
            XCTFail("Error should not be triggered")
        }
        
        // Act
        viewModel.fetchMeals()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            // Assert
            XCTAssertEqual(self.viewModel.meals, mockMeals)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
}
