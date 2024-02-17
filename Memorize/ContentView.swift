//
//  ContentView.swift
//  Memorize
//
//  Created by hok on 2/16/24.
//

import SwiftUI

struct ContentView: View {

    
    
    var body: some View {
        HStack (content:{
            CardView()
            CardView()
            CardView()
            CardView()
        })
        .padding()
        .foregroundColor(.green)
    }
}


struct CardView: View{
    var body: some View{
        ZStack ( content:{  // function
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.white)
            RoundedRectangle(cornerRadius: 15)
                .strokeBorder( lineWidth:5)
            
            Text("🥲").font(.largeTitle)
            
        })
    }
}






struct ContentView_Previews:PreviewProvider {
    static var previews: some View{
        ContentView()
    }
    
}
