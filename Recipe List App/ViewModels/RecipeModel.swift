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
    
   static func getPortion(ingredient:Ingredient,recipeServings:Int,targetServings:Int) -> String {
       
       var portion = ""
       var numerator = ingredient.num ?? 1
       var denominator = ingredient.denom ?? 1
       var wholePortions = 0
       
       if ingredient.num != nil {
           denominator = denominator * recipeServings
           
           numerator *= targetServings
           
           let divisor = Rational.greatestCommonDivisor(numerator, denominator)
           
           numerator /= divisor
           
           denominator /= divisor
           
           if numerator >= denominator {
              wholePortions = numerator / denominator
               numerator = numerator % denominator
               portion += String(wholePortions) //append to portion
           }
           
           if numerator > 0 {
               portion += wholePortions > 0 ? " " : ""
               portion += "\(numerator) /\(denominator)"
           }
       }
       if var unit = ingredient.unit{
           

           //pluralise
           if wholePortions > 1 {
           if unit.suffix(2) == "ch" {
               unit += "es"
           }else if unit.suffix(1) == "f"{
               unit = String(unit.dropLast())
               unit += "ves"
           }else{
               unit += "s"
           }
           }
           portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
           return portion + unit
       }
       return portion
    }
}
