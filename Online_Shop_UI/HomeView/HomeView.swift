//
//  HomeView.swift
//  Online_Shop_UI
//
//  Created by Stanley Pan on 2022/01/09.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedIndex: Int = 0
    private let categories = ["All", "Chair", "Sofa", "Lamp", "Kitchen", "Table"]
    
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
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
                    
                    Text("Popular")
                        .font(.custom("PlayfairDisplay-Bold", size: 24))
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< 4) { index in
                                ProductCardView(image: Image("chair_\(index + 1)"), size: 210)
                            }
                            .padding(.trailing)
                        }
                        .padding(.leading)
                    }
                    
                    Text("Best")
                        .font(.custom("PlayfairDisplay-Bold", size: 24))
                        .padding(.horizontal)
                        .padding(.top)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< 4) { index in
                                ProductCardView(image: Image("chair_\(index + 1)"), size: 180)
                            }
                            .padding(.trailing)
                        }
                        .padding(.leading)
                    }
                }
            }
            
            // MARK: Custom Bottom TabBar
            HStack {
                Spacer()
                
                Button(action: { }, label: {
                    Image("home")
                        .frame(maxWidth: .infinity)
                })
                
                Spacer()
                
                Button(action: { }, label: {
                    Image(systemName: "suit.heart")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: 24)
                        .foregroundColor(Color.black.opacity(0.7))
                    
                })
                
                Spacer()
                
                Button(action: { }, label: {
                    Image(systemName: "cart")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: 26)
                        .foregroundColor(Color.black.opacity(0.7))
                })
                
                
                Spacer()
                
                Button(action: { }, label: {
                    Image("user")
                        .frame(maxWidth: .infinity)
                })
                
                Spacer()
            }
            .padding()
            .background(Color.white)
            .clipShape(Capsule())
            .padding(.horizontal)
            .shadow(color: Color.black.opacity(0.15), radius: 8, x: 2, y: 6)
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
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

struct ProductCardView: View {
    let image: Image
    let size: CGFloat
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200 * (size / 210))
                .cornerRadius(20.0)
            
            Text("Luxury Swedian Chair")
                .font(.title3).bold()
            
            HStack(spacing: 2) {
                ForEach(0 ..< 5) { _ in
                    Image("star")
                }
                
                Spacer()
                
                Text("$1299")
                    .font(.title3).bold()
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
    }
}
