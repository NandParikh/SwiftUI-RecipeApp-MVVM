//
//  RecipeView.swift
//  RecipeApp
//
//  Created by                     Nand Parikh on 10/11/25.
//

import SwiftUI

struct RecipeView: View {
    var vm: RecipeViewModel = RecipeViewModel()
    
    var body: some View {
        NavigationStack {
            List(vm.recipeModels) {recipe in
                
                NavigationLink {
                    ShowRecipeView(
                        theRecipe: recipe.recipe,
                        imageName: recipe.recipeImage,
                        recipeUrl: recipe.recipeURL
                    )
                } label: {
                    ListItemView(name: recipe.name, categoriesPer100Grams: recipe.caloriesPer100Grams, recipeImage: recipe.recipeImage)
                }
            }
            .navigationTitle("Recipe")
        }
    }
}

#Preview {
    RecipeView()
}
