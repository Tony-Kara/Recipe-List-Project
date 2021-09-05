//
//  ContentView.swift
//  Recipe List Project
//
//  Created by mac on 9/4/21.
//

import SwiftUI

struct RecipeListView: View {
    // reference the view model
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        
        NavigationView {
            List(model.recipes){ r in
                
                NavigationLink(
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
    }
}
