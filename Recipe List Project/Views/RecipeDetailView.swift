//
//  RecipeDetailView.swift
//  Recipe List Project
//
//  Created by mac on 9/6/21.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe // create an instance of the model without initialising it.
    
    @State var selectedServingSize = 2
    var body: some View {
        
       
        ScrollView{
            
            VStack(alignment: .leading) {
                
                //MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                //MARK: Recipe title
                Text(recipe.name)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(.largeTitle)
                
               //MARK: Serving Size Picker
                
                VStack {
                    Text("Select your serving size:")
                    Picker("", selection: $selectedServingSize){
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                }
                .padding()
                
                //MARK: Igredients
                VStack(alignment: .leading) {
                    Text("ingredients")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    
                    ForEach(recipe.ingredients){ items in
                        // recipeServings here will come directly from the  "servings" object in my JSON file,
                        Text("• " + RecipeModel.getPortion(ingredient: items, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + items.name.lowercased())
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
                        
                    // in a foreach loop, it is used for displaying various views, it requires the use of "id: \.self"
                    ForEach(0..<recipe.directions.count, id: \.self){ index in
                        
                        Text("\(index + 1)" + ". " + recipe.directions[index])
                    }
                }
                .padding(.horizontal)
            }
           
        }
      //  .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // We'll have to pass in a dummy recipe to the preview
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
      
    }
}
