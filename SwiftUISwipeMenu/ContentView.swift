//
//  ContentView.swift
//  SwiftUISwipeMenu
//
//  Created by ricardo silva on 22/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var size: CGFloat = UIScreen.main.bounds.height - 150
    var body: some View {
        
        ZStack {
            Color.orange
            swipe()
                .background(.white)
                .cornerRadius(20)
                .padding(15)
                .offset(y: size)
                .gesture(DragGesture().onChanged({ value in
                    if value.translation.height > 0 {
                        self.size = value.translation.height
                    } else {
                        let temp = UIScreen.main.bounds.height - 150
                        self.size = temp + value.translation.height
                    }
                }).onEnded({ value in
                    if value.translation.height > 0 {
                        if value.translation.height > 200 {
                            self.size = UIScreen.main.bounds.height - 150
                        } else {
                            self.size = 15
                        }
                    } else {
                        if value.translation.height < -200 {
                            self.size = 15
                        } else {
                            self.size = UIScreen.main.bounds.height - 150
                        }
                    }
                })).animation(.spring())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct swipe: View {
    var body: some View {
        
        VStack {
            VStack {
                Text("Swipe up to see more")
                    .fontWeight(.heavy)
                .padding([.top, .bottom], 15)
            }
            
            HStack {
                Spacer()
                Text("Hello top")
                    .fontWeight(.heavy)
                .padding()
            }
            Spacer()
            Text("Hello bot")
                .fontWeight(.heavy)
                .padding()
        }
    }
}
