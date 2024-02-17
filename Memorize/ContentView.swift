//
//  ContentView.swift
//  Memorize
//
//  Created by hok on 2/16/24.
//

import SwiftUI

struct ContentView: View { // Behaves like a View
    let emojis: [String] = ["🥲", "1", "2", "3","4","5","6","7","8", "9"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
//        let emojis: Array<String> = ["🥲", "1", "2", "3"]
        
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
        
    }
    
    
    var cards : some View{
        // implicit return
        LazyVGrid(columns: [GridItem(.adaptive(minimum:120))]) {
            ForEach(0..<cardCount, id: \.self){ idx in
                CardView(contentStr: emojis[idx])
                    .aspectRatio(2/3, contentMode:.fit)
            }
            
        }
        .foregroundColor(.green)
    }
    
    var cardCountAdjusters: some View{
        HStack {
            
            cardRemover
            Spacer()
            cardAdder
            
        }.imageScale(.large)
    }
    
    // by is external para name, offset is internal para name
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View
    {
        Button(action: {
            if (offset > 0 && cardCount < emojis.count) || (offset < 0 && cardCount > 1){
                cardCount += offset
            }
            
            
        }, label: {
            Image(systemName: symbol)
        })
//        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    var cardRemover: some View{
        return cardCountAdjuster(by:-1,symbol: "rectangle.stack.badge.minus")
    }
    
    var cardAdder: some View{
        return cardCountAdjuster(by:+1,symbol: "rectangle.stack.badge.plus")
    }
}


struct CardView: View{
    let contentStr: String
    @State var isFaceUp = true
    var body: some View{
        ZStack (alignment: .center, content:{  // function
            //let: constant, var: variable
            let base =  RoundedRectangle(cornerRadius: 15)
            Group {
                
                base.fill(.white)
                base.strokeBorder(lineWidth:5)
                
                Text(contentStr).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1:0)
            base.fill().opacity(isFaceUp ? 0:1)
            
            
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
