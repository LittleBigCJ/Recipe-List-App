//
//  DataService.swift
//  Recipe List App
//
//  Created by Chris Houghton on 27/09/2021.
//

import Foundation

class DataService {
    
   static func getLocalData() -> [Recipe]{
        //parse local json file
        
        //get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
//        check if pathString is not nil, otherwise..
        guard pathString != nil else{
            return [Recipe]()
            
        }
        //create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            //create a data object
            let data = try Data(contentsOf: url)
            
            //decode the data with a json decoder
            let decoder = JSONDecoder()
            
            do{
                let recipeData = try decoder.decode([Recipe].self, from: data)
                 //add unique IDs
                for r in recipeData {
                    r.id = UUID()
                }
                 //return the recipes
                
            return recipeData
            } catch{
                //error with catching json
                print(error)
            }
 
            
            
        }catch {
            //error with getting data
            print(error)
            
        }

       return [Recipe]()
        
    }
    
    
}
