//
//  ContentView.swift
//  Shared
//
//  Created by Diego Herrera Rivera on 11/05/22.
//

import SwiftUI

struct ContentView: View {
    @State var showCartView = false
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .center) {
                    HStack {
                        Image("lord")
                            .renderingMode(.original)
                            .resizable()
                            .padding(.horizontal)
                            .aspectRatio(contentMode: .fit)
                            .clipped()
                            .cornerRadius(30)
                            .shadow(radius: 10)
                    }
                    .frame(height: 250)
                    
                    Text("J.R.R. Tolkien")
                        .foregroundColor(.gray.opacity(0.7))
                        .font(.caption)
                        .padding(.horizontal,16)
                    Text("The Fellowship of the Ring")
                        .font(.headline)
                        .padding(.horizontal, 8)
                        .padding()
                    Text("The fellowship of the Ring is the first three columes in the Lord Of The Rings, an epic set in the functional world of the Middle-earth. The Lord of the Rings is an etity named Sauron, the dark..")
                    .foregroundColor(.gray.opacity(0.7))
                        .padding(.horizontal, 16)
                        .frame(alignment: .center)
                    
                    HStack {
                        GenreButton(name: "Fantasy")
                        GenreButton(name: "Action")
                        GenreButton(name: "Novel")
                    }
                    Divider()
                        .padding(.all, 16)
                    
                    Button("Buy for 18.85$") {}
                        .font(.system(size: 16, weight: .semibold, design: .default))
                        .padding()
                        .foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 20))
                    
                }
                .sheet(isPresented: $showCartView, content: {
                    CartView(showModal: $showCartView)
                })
                .navigationTitle("Movie Detail")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button("🛒") {
                        self.showCartView = true
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

struct GenreButton: View {
    var name:String
    var body: some View {
        Text(name)
            .font(.system(size: 16, weight: .semibold, design: .default))
            .frame(width: 80, height: 30)
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10)
            .stroke(.gray, lineWidth: 1))
    }
}
