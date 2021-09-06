//
//  RecipeDetailView.swift
//  Recipe List Project
//
//  Created by mac on 9/6/21.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe // create an instance of the model without initialising it.
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
                        .padding([.bottom, .top], 5)
                    
                    ForEach(recipe.ingredients, id: \.self){ items in
                        
                        Text("• " + items)
                    }
                    
                }
                .padding(.horizontal)
                
                //MARK: Divider
                
                Divider()
                
                //MARK: Directions
                
                VStack(alignment: .leading){
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                        
                    
                    ForEach(0..<recipe.directions.count, id: \.self){ index in
                        
                        Text("\(index + 1)" + ". " + recipe.directions[index])
                    }
                }
                .padding(.horizontal)
            }
           
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[2])
    }
}
