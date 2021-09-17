//
//  RecipeModel.swift
//  Recipe List Project
//
//  Created by mac on 9/5/21.
//

import Foundation

class RecipeModel: ObservableObject { // making this observable ensures changes here can be listened to
    
    @Published var recipes = [Recipe]() //   @Published ensures that this property broadcasts any changes to it
    
    init() {
        
        // create an instance of data services and get the data
        
        self.recipes = DataService.getLocalData()
    }
    
}
