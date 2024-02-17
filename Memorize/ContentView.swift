//
//  ContentView.swift
//  Memorize
//
//  Created by hok on 2/16/24.
//

import SwiftUI

struct ContentView: View { // Behaves like a View

    
    var body: some View {
        HStack (content:{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        })
        .padding()
        .foregroundColor(.green)
    }
}


struct CardView: View{
    var isFaceUp: Bool = false
    var body: some View{
        ZStack ( content:{  // function
            
            if isFaceUp {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder( lineWidth:5)
                
                Text("🥲").font(.largeTitle)
            }else{
                RoundedRectangle(cornerRadius: 15)
            }
            
            
        })
    }
}






struct ContentView_Previews:PreviewProvider {
    static var previews: some View{
        ContentView()
    }
    
}
