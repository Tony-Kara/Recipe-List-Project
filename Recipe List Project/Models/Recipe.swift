//
//  Recipe.swift
//  Recipe List Project
//
//  Created by mac on 9/4/21.
//

import Foundation

class Recipe: Identifiable, Decodable { // using a list in any of your views means you have to ensure that your model conforms to the "Identifiable" protocol, ensure you create an id property which will be optional " var id: UUID?" 
    
    var id: UUID?
    var  name: String
    var   featured: Bool
    var  image : String
    var  description: String
    var  prepTime: String
    var   cookTime: String
    var  totalTime: String
    var   servings: Int
    var  ingredients: [String]
    var  directions: [String]
    
    

    
}
