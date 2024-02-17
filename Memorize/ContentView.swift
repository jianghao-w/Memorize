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
    @State var isFaceUp = false
    var body: some View{
        ZStack (alignment: .top, content:{  // function
            //let: constant, var: variable
            let base =  RoundedRectangle(cornerRadius: 15)
            if isFaceUp {
                
                base.fill(.white)
                base.strokeBorder(lineWidth:5)
                
                Text("🥲").font(.largeTitle)
            }else{
                base.fill()
            }
            
            
        })
        .onTapGesture {
            //@State
//            isFaceUp = !isFaceUp
            isFaceUp.toggle()
        }
    }
}






struct ContentView_Previews:PreviewProvider {
    static var previews: some View{
        ContentView()
    }
    
}
