//
//  ContentView.swift
//  Online_Shop_UI
//
//  Created by Stanley Pan on 2022/01/08.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        VStack {
            ZStack {
                Color("background")
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("chair_1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)
                    
                    DescriptionView()
                        .offset(y: -40)
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

struct DescriptionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Luxury Swedian \nChair")
                .font(.title).bold()
            
            HStack(spacing: 4) {
                ForEach(0 ..< 5) { _ in
                    Image("star")
                }
                
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                
                Spacer()
            }
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            Text("Luxury Swedian Chair is a contemporary chair based on the virtues of modern craft. It carries on the simplicity and honesty of the archetypical chair.")
                .lineSpacing(8.0)
                .opacity(0.6)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Size")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    
                    Text("Height: 120 cm")
                        .opacity(0.6)
                    
                    Text("Width: 80 cm")
                        .opacity(0.6)
                    
                    Text("Diameter: 72cm")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading) {
                    Text("Treatment")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    
                    Text("Jati Wood, Canvas, \nAmazing Love")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
            
            HStack {
                VStack {
                    Text("Colors")
                        .fontWeight(.semibold)
                }
            }
        }
        .padding()
        .padding(.top)
        .background(Color("background"))
        .cornerRadius(40.0)
    }
}
