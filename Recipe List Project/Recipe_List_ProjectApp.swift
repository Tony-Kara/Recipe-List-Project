//
//  Recipe_List_ProjectApp.swift
//  Recipe List Project
//
//  Created by mac on 9/4/21.
//

import SwiftUI

@main
struct Recipe_List_ProjectApp: App {
    var body: some Scene {
        WindowGroup {
            RecipeTabView()
                .environmentObject(RecipeModel())
        }
    }
}
