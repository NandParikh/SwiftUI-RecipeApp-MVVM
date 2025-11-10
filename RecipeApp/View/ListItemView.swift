//
//  ListItemView.swift
//  RecipeApp
//
//  Created by                     Nand Parikh on 10/11/25.
//

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
