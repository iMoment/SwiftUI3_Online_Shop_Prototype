//
//  ContentView.swift
//  Online_Shop_UI
//
//  Created by Stanley Pan on 2022/01/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                TopBarView()
                
                TagLineView()
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TopBarView: View {
    var body: some View {
        HStack {
            Button(action: { }, label: {
                Image("menu")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10.0)
            })
            
            Spacer()
            
            Button(action: { }, label: {
                Image("psyduck")
                    .resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10.0)
            })
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find The \nBest ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("primary"))
        + Text("Furniture!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .foregroundColor(Color("primary"))
    }
}
