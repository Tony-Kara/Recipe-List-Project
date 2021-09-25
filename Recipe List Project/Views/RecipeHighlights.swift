//
//  RecipeHighlights.swift
//  Recipe List Project
//
//  Created by mac on 9/25/21.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    
    init(highlights:[String]){
        
        //Loop through the highlights and build the string
        for index in 0..<highlights.count {
            
            if index == highlights.count - 1 {
                allHighlights += highlights[index]
            }
            
            else {
                allHighlights += highlights[index] + ", "
            }
        }
    }
    
    var body: some View {
        Text(allHighlights)
            .font(Font.custom("Avenir", size: 15))
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test", "test2", "test3"])
    }
}
