//
//  ContentView.swift
//  Online_Shop_UI
//
//  Created by Stanley Pan on 2022/01/08.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedIndex: Int = 0
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
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<categories.count) { index in
                            CategoryView(isActive: index == selectedIndex, text: categories[index])
                                .onTapGesture {
                                    selectedIndex = index
                                }
                        }
                    }
                    .padding()
                }
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
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.white)
                    .frame(width: 30, height: 30)
                    .padding()
                    
            })
            .background(Color("primary"))
            .cornerRadius(10.0)
            
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(isActive ? Color("primary") : Color.black.opacity(0.5))
            
            if isActive {
                Color("primary")
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}
