//
//  DataService.swift
//  Recipe List Project
//
//  Created by mac on 9/5/21.
//

import Foundation

class DataService {
    
  static  func getLocalData() -> [Recipe] {
        
        //Parse local json file
        
        //Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "data", ofType: "json")
        
        guard pathString != nil else { return [Recipe]() }
        
        //Create a url object
        
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            
            //Create a data object
            let data = try  Data(contentsOf: url)
            
            // Decode the date with a JSON decoder
            
            let decode = JSONDecoder()
            
            do {
                //all my recipes have been stored in this object recipeData
                let recipeData = try decode.decode([Recipe].self, from: data)
                
                // Add the unique IDs
                
                for r in recipeData {
                    
                    r.id = UUID()
                    
                }
                
                // Return the recipes
                return recipeData
                
            }
            
            catch  {
                print(error)
            }
            
            
            
        } catch  {
            print(error)
        }
        
        
        return [Recipe]() // return an emoty string of recipe if code falls here
        
        
        
        
    }
}
