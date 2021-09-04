//
//  Recipe.swift
//  Recipe List Project
//
//  Created by mac on 9/4/21.
//

import Foundation

class Recipe: Identifiable, Decodable {
    var id: UUID?
    var  name: String
    var   featured: Bool
    var  image : String
    var  description: String
    var  prepTime: String
    var   cookTime: String
    var  totalTime: String
    var   serving: Int
    var  ingredients: [String]
    var  directions: [String]
    
    
}
