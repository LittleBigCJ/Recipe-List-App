//
//  ContentView.swift
//  Recipe List App
//
//  Created by Chris Houghton on 27/09/2021.
//

import SwiftUI

struct RecipeListView: View {
    
    
    @EnvironmentObject var model:RecipeModel
    
    
    var body: some View {
        
        
        
        
        NavigationView {
            
            VStack(alignment: .leading){
                
                Text("All Recipes")

                    .padding(.top,40)
                    .font(Font.custom("Avenir Heavy", size: 24))
                
                ScrollView{
                    LazyVStack(alignment: .leading){
                        ForEach(model.recipes){ r in
                            
                            NavigationLink(
                                destination: RecipeDetailView(recipe:r),
                                label: {
                                    
                                    //MARK: Row Item
                                    HStack(spacing: 20.0) {
                                        Image(r.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            .clipped()
                                            .cornerRadius(5)
                                        VStack(alignment:.leading){
                                        Text(r.name)
                                            .foregroundColor(.black)
                                            .font(Font.custom("Avenir Heavy", size: 16))
                                            RecipeHighlights(highlights: r.highlights)
                                                .foregroundColor(.black)
                                               
                                        }
                                    }
                                })
                            
                        }
                        .navigationBarHidden(true)
                    }
                }
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView().environmentObject(RecipeModel())
    }
}
