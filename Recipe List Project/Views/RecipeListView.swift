//
//  ContentView.swift
//  Recipe List Project
//
//  Created by mac on 9/4/21.
//

import SwiftUI

struct RecipeListView: View {
    // reference the view model
//    @ObservedObject var model = RecipeModel() // on initialization, the code inside the init method runs, ensure the instance is an observed state property
    
    @EnvironmentObject var model:RecipeModel
    var body: some View {
        
        NavigationView { // put everything in a naviagtion list
            List(model.recipes){ r in // Here, i am looping through this array of data and bringing out what i need, at this point, i do not need to add an "id" as i have ensured that my Model conforms to the "Identifiable" protocol.
                
                NavigationLink( // add a navigation link
                    destination: RecipeDetailView(recipe: r),
                    label: {
                        //MARK: Row item
                        HStack(spacing: 20.0) {
                            Image(r.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50, alignment: .center)
                                .clipped()
                                .cornerRadius(5)
                            
                            Text(r.name)
                        }
                    })
                
               
            }
            .navigationBarTitle("All recipes")
        }
        
}

}
struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
