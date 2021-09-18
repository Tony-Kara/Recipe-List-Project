//
//  RecipeTabView.swift
//  Recipe List Project
//
//  Created by mac on 9/17/21.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        
        TabView{
            RecipeFeaturedView() //instatiate the RecipeFeaturedView here
                .tabItem {
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            RecipeListView() //instatiate the RecipeListView here, a way to display a view
                .tabItem {
                   VStack{
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
            
        }
        .environmentObject(RecipeModel()) // create an environmentObject in the top hierachy of your App, instatiate the viewmodel class. Note that the RecipeListView() is a subview of the Tabview and already present here, i just need to create "  @EnvironmentObject var model:RecipeModel" inside the RecipeListView()  to have access to all the properties present in my model.
        
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
