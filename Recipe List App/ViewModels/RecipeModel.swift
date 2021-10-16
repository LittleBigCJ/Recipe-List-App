//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Chris Houghton on 27/09/2021.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init(){
        
     //create an instance of data service and get the data
     self.recipes = DataService.getLocalData()
    }
}
