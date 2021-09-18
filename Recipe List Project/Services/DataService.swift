//
//  DataService.swift
//  Recipe List Project
//
//  Created by mac on 9/5/21.
//

import Foundation

class DataService {
    
  static  func getLocalData() -> [Recipe] {
        
    // Parse local json file
    
    // Get a url path to the json file
    let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
    
    // Check if pathString is not nil, otherwise...
    guard pathString != nil else {
        return [Recipe]()
    }
    
    // Create a url object
    let url = URL(fileURLWithPath: pathString!)
    
    do {
        // Create a data object
        let data = try Data(contentsOf: url)
        
        // Decode the data with a JSON decoder
        let decoder = JSONDecoder()
        
        do {
            
            let recipeData = try decoder.decode([Recipe].self, from: data)
            
            // Add the unique IDs
            for r in recipeData { // loop thorugh the data and add a UUID number to each object in the array, this is important since this particular key value pair was not present in the original API whch is the local directory and will have caused an error.
                r.id = UUID()
                
                for i in r.ingredients {
                    i.id = UUID() // set the id for each igredient property inside the igredients array
                }
            }
            
            // Return the recipes
            return recipeData
        }
        catch {
            // error with parsing json
            print(error)
        }
    }
    catch {
        // error with getting data
        print(error)
    }
    
    return [Recipe]()
        
        
        
    }
}
