//
//  RecipeFeaturedView.swift
//  Recipe List Project
//
//  Created by mac on 9/18/21.
//

import SwiftUI

struct RecipeFeaturedView: View {

    @EnvironmentObject var model: RecipeModel
    @State var isDetailViewShowing = false
    // use this to keep track of what recipe the user is viewing and pass it down to the Vstack that is not inside the foreach loop, the last vstack containing the preparation time and highlights.
    @State var tabSelectionIndex = 0
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(Font.custom("Avenir Heavy", size: 24))
            
            GeometryReader { geo in
                // keeo track of the user taps and store in the state property, add a tag below with the index
                TabView(selection: $tabSelectionIndex) {
                
                //Loop  through each recipe, USE THE INDEX based forEach loop when you write an expression with a condition that needs to be checked
                 ForEach(0..<model.recipes.count){ index in
                    
                    //only show those that should be feautured, THIS is the CONDITION i need to satisfy in order to run the block of codes in it
                    if model.recipes[index].featured == true {
                        
                        //Recipe card button
                        Button(action: {
                            // show the recipe detail sheet
                            self.isDetailViewShowing = true
                            
                        }, label: {
                            // putting the whole Zstack as a label
                            ZStack {
                                // Recipe card
                                Rectangle() // creating a card
                                    .foregroundColor(.white)
                                    
                                
                                VStack(spacing:0) {
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    Text(model.recipes[index].name)
                                        .padding(5)
                                        .font(Font.custom("Avenir", size: 15))
                                }
                            }
                            
                        })
                        .tag(index) // add a tag to keep track of user selected recipe
                        // use this to display a pop up card when the user taps on it
                        .sheet(isPresented: $isDetailViewShowing, content: {
                            //show the RecipeDetailView
                            RecipeDetailView(recipe: model.recipes[index])
                            
                        })
                        
                        // This ensures the Text on display is not coloured and just plain
                        .buttonStyle(PlainButtonStyle())
                      .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(15)
                        .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                        
                        
                    }
                  
                     
                 }
            } // use this to add scrolls on the bottom to scroll through pages
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            //this modifier ensures that the ... for scrolling pages always appears
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
            
            
            VStack(alignment:.leading, spacing: 10){
                Text("Preparation Time")
                    .font(Font.custom("Avenir Heavy", size: 16))
                //The exact row number the user swipes on in the Tabview is stored inside the "tabSelectionIndex" which i can pass below maintaining a dynamic consistency.
                Text(model.recipes[tabSelectionIndex].prepTime)
                    .font(Font.custom("Avenir", size: 15))
                Text("Highlights")
                    .font(Font.custom("Avenir Heavy", size: 16))
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
               
            }
            .padding([.leading, .bottom])
        
        }
        .onAppear(perform: {
            setFeaturedIndex()
        })
       
    }
    
    
    func setFeaturedIndex() {
        
        //Find the index number of the first recipe that is feautured and return the index number of the row this occured
       var index =  model.recipes.firstIndex { (recipe) in
            return recipe.featured // return the index number of the first row that has recipe.featured == true
         }
        
        tabSelectionIndex = index ?? 0
    }
    
    
    
    
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
