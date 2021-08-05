//
//  ContentView.swift
//  Slots
//
//  Created by Joshua Curry on 8/5/21.
//

import SwiftUI

struct ContentView: View {
    @State private var credits = 2000
    @State private var slots = ["cherry", "apple", "star"]
    @State private var isEarningsVisible = false
    @State private var earnings = ""
    @State private var earningsColor = Color.white
    var body: some View {
        ZStack(){
            Color(red: 0.5, green: 0.5, blue: 1.0)
                .ignoresSafeArea()
            VStack(){
                Text("$\(credits)")
                    .font(.title)
                    .foregroundColor(Color.white)
                Spacer()
                HStack {
                    ForEach(slots.indices) { index in
                        Image(slots[index])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                    }
                }
                Spacer()
                Text(isEarningsVisible ? earnings : "")
                        .font(.title2)
                    .foregroundColor(earningsColor)
                    .animation(.easeInOut, value: isEarningsVisible)
                
                Spacer()
                Button(action: {
                    for i in 0...2 {
                        slots[i] = ["cherry", "apple", "star"].randomElement()!
                    }
                    if slots[0] == slots[1] && slots[1] == slots[2] {
                        credits += 200
                        earnings = "+ $200"
                        earningsColor = Color.green
                    }
                    else {
                        credits -= 100
                        earnings = "- $100"
                        earningsColor = Color.red
                    }
                    isEarningsVisible = true
                }, label: {
                    Text("Spin!")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                })
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
