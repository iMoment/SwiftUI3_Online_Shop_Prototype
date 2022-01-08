//
//  ContentView.swift
//  Online_Shop_UI
//
//  Created by Stanley Pan on 2022/01/08.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    private let categories = ["All", "Chair", "Sofa", "Lamp", "Kitchen", "Table"]
    
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                TopBarView()
                
                TagLineView()
                    .padding()
                
                SearchScanView()
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

struct SearchScanView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        HStack {
            HStack {
                Image("search")
                    .padding(.trailing, 8)
                TextField("Search Furniture", text: $searchText)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing)
            
            Button(action: { }, label: {
                Image(systemName: "barcode.viewfinder")
                    .padding(.all, 12)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(Color.white)
                    
            })
            .background(Color("primary"))
            .cornerRadius(10.0)
            
        }
        .padding(.horizontal)
    }
}
