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
            Text("Featured View")
                .tabItem {
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            RecipeListView() //instatiate the listView here
                .tabItem {
                   VStack{
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
            
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
