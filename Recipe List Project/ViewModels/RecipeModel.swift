//
//  RecipeModel.swift
//  Recipe List Project
//
//  Created by mac on 9/5/21.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // create an instance of data services and get the data
        
        self.recipes = DataService.getLocalData()
    }
    
}
