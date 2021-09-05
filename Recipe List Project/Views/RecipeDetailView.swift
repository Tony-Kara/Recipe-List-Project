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
            //MARK: Recipe Image
            //MARK: Igredients
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
