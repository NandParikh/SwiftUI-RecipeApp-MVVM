//
//  RecipeModel.swift
//  RecipeApp
//
//  Created by                     Nand Parikh on 10/11/25.
//

import Foundation

struct RecipeModel: Identifiable {
    let id = UUID()
    let name: String
    let caloriesPer100Grams: Int
    let recipe: String
    let recipeImage: String
    let recipeURL: String
}

