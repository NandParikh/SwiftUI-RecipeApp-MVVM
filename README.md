
https://github.com/user-attachments/assets/55b5b152-b001-4bc1-ac13-f76c4734f7bb

---
Overview:
---
This SwiftUI application demonstrates the MVVM (Model-View-ViewModel) architecture using a Recipe
app example. It lists recipes, displays detailed recipe instructions, and includes navigation between
screens using SwiftUI's NavigationStack.

---
■ Folder Structure:
---
• Model – Contains the RecipeModel struct defining data properties.

• View – Includes SwiftUI Views such as RecipeView, ListItemView, and ShowRecipeView for UI
rendering.

• ViewModel – Contains RecipeViewModel class responsible for data initialization and logic.

• RecipeAppApp – Main entry point of the application.


---
Entry Point
---
```swift

import SwiftUI

@main
struct RecipeAppApp: App {
    var body: some Scene {
        WindowGroup {
            RecipeView()
        }
    }
}
```

---
Model
---
```swift
import Foundation

struct RecipeModel: Identifiable {
    let id = UUID()
    let name: String
    let caloriesPer100Grams: Int
    let recipe: String
    let recipeImage: String
    let recipeURL: String
}
```


---
ViewModel
---
```swift
@Observable class RecipeViewModel {
    var recipeModels: [RecipeModel] = []
    
    // Initialize the model
    init() {
        recipeModels.append(
            RecipeModel(
                name: "Hummus",
                caloriesPer100Grams: 322,
                recipe: """
**Ingredients**V

- 1 (15-ounce) can rehickpeas or 1 ½ cups (250 grams) cooked chickpeas
- 1/4 cup (60 ml) fresh lemon juice, 1 large lemon
- 1/4 cup (60 ml) well-stirred tahini, see our homemade tahini recipe
- 1 small garlic clove, minced
- 2 tablespoons (30 ml) extra-virgin olive oil, plus more for serving
- 1/2 teaspoon ground cumin
- Salt to taste
- 2 to 3 tablespoons (30 to 45 ml) water or aquafaba
- Dash ground paprika or sumac

""",
                recipeImage: "IMGhummus",
                recipeURL: "https://www.inspiredtaste.net/15938/easy-and-smooth-hummus-recipe/")
        )
        
        recipeModels.append(
            RecipeModel(
                name: "1",
                caloriesPer100Grams: 166,
                recipe: """
**Ingredients**

- 1 1/2 cups (355 ml) warm water (105°F-115°F)
- 1 package (2 1/4 teaspoons) active dry yeast
- 3 3/4 cups (490g) bread flour
- 2 tablespoons extra virgin olive oil (omit if cooking pizza in a wood-fired pizza oven)
- 2 teaspoons kosher salt
- 1 teaspoon sugar
- Extra virgin olive oil
- Cornmeal (to help slide the pizza onto the pizza stone)
- Tomato sauce (smooth or pureed)
- Firm mozzarella cheese, grated
- Fresh soft mozzarella cheese, separated into small clumps
- Fontina cheese, grated
""",
                recipeImage: "IMGPizza",
                recipeURL: "https://www.simplyrecipes.com/recipes/homemade_pizza/")
        )
    }
    
}

```
---
View
---

---
ListItemView
---
```swift
import SwiftUI

struct ListItemView: View {
    
    let name : String
    let categoriesPer100Grams : Int
    let recipeImage : String
    
    let imgDim : CGFloat = 70
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 5){
                Text(name)
                    .foregroundStyle(Color.orange)
                Text("\(categoriesPer100Grams) Categories Per 100 grams")
                    .font(.caption)
                    .foregroundStyle(Color.white)
                    .fontWeight(.semibold)
            }
            Spacer()
            Image(recipeImage)
                .resizable()
                .frame(width: imgDim, height: imgDim)
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 1)
                }.shadow(color: .white.opacity(0.7), radius: 10)
            
        }
        .padding(.horizontal)
        .background(Color.black.cornerRadius(10))
        
    }
}

#Preview {
    ListItemView(
        name: "Humms",
        categoriesPer100Grams: 500,
        recipeImage: "IMGhummus"
    )
}
```

---
RecipeView
---
```swift
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
```

---
ShowRecipeView
---
```swift
import SwiftUI

struct ShowRecipeView: View {
    let theRecipe: String
    let imageName : String
    let recipeUrl : String
    
    var body: some View {
        ZStack{
            Color.gray.opacity(0.7)
                .ignoresSafeArea()
            
            VStack{
                ScrollView{
                    Text(theRecipe)
                        .padding()
                }
                
                Spacer()
                
                Link(destination: URL(string: recipeUrl)!) {
                    ZStack{
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                            .scaleEffect(0.8)
                        
                        Text("Click Image for recipe")
                            .foregroundStyle(Color.orange)
                            .font(.headline)
                            .padding()
                            .background(
                                Capsule()
                                    .fill(Color.black.opacity(0.7))
                            )
                    }
                }
                
            }
        }
    }
}

#Preview {
    ShowRecipeView(
        theRecipe:
                        """
            **Ingredients**
            - 1 (15-ounce) can chickpeas or 1 ½ cups (250 grams) cooked chickpeas
            - 1/4 cup (60 ml) fresh lemon juice, 1 large lemon
            - 1/4 cup (60 ml) well-stirred tahini, see our homemade tahini recipe
            - 1 small garlic clove, minced
            - 2 tablespoons (30 ml) extra-virgin olive oil, plus more for serving
            - 1/2 teaspoon ground cumin
            - Salt to taste
            - 2 to 3 tablespoons (30 to 45 ml) water or aquafaba
            - Dash ground paprika or sumac
            """,
        imageName: "IMGhummus",
        recipeUrl: "https://www.inspiredtaste.net/15938/easy-and-smooth-hummus-recipe/"
    )
}

```
