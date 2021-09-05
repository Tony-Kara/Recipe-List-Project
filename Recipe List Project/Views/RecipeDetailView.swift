//
//  RecipeDetailView.swift
//  Recipe List Project
//
//  Created by mac on 9/6/21.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    var body: some View {
        
       
        ScrollView{
            
            VStack(alignment: .leading) {
                
                //MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                //MARK: Igredients
                VStack(alignment: .leading) {
                    Text("ingredients")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    ForEach(recipe.ingredients, id: \.self){ items in
                        
                        Text("• " + items)
                    }
                    
                }
                
                
                //MARK: Directions
                
                VStack(alignment: .leading){
                    Text("Directions")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    ForEach(recipe.directions, id: \.self){ items in
                        
                        Text(items)
                    }
                }
            }
           
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
