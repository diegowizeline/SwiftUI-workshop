//
//  BookDetailView.swift
//  FirstUI
//
//  Created by Juan Enriquez on 12/05/22.
//

import Foundation


import SwiftUI

struct BookDetailView: View {
    @State var showCartView = false

    var body: some View {
        NavigationView {
            HStack{
                Spacer(minLength: 16)
                VStack(spacing: 20.0){
                    Image("lordBook")
                        .resizable()
                        .frame(width: 200, height: 300)
                        //.shadow(radius: 20)
                        .cornerRadius(10)
                        .shadow(color: Color.gray.opacity(0.6), radius: 10, x: 10, y: 15)
                    VStack{
                        Text("J.R.R. Tolkien")
                            .foregroundColor(Color.gray)
                        Text("The Fellowship of the Ring")
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                    }
                    Text("The Fellowship of the Ring is the first of three volumes of the epic novel[2] The Lord of the Rings by the English author J. R. R. Tolkien. It is followed by The Two Towers and The Return of the King. It takes place in the fictional universe of Middle-earth, and was originally published on 29 July 1954 in the United Kingdom.The volume consists of a foreword, in which the author discusses his writing of The Lord of the Rings, a prologue titled Concern, and the main narrative in Book I and Book II.")
                        .foregroundColor(Color.secondary)
                        .padding()
                        .font(.system(size: 18))
                        .lineLimit(4)
                    HStack{
                        BookDetailLabel(text: "Fantasy")
                        BookDetailLabel(text: "Action")
                        BookDetailLabel(text: "Novel")
                    }
                    Divider()
                    BuyButtonView(text: "Buy for $19.99", buttonColor: Color.black)
                }
                Spacer(minLength: 16)
            }
            .sheet(isPresented: $showCartView, content: {
                CartView(showModal: $showCartView)
            })
            .navigationTitle("Detail")
            .toolbar {
                Button("🛒") {
                    self.showCartView = true
                }
            }
        }
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView()
            .preferredColorScheme(.light)
            .previewDevice("iPhone 12 Pro Max")
    }
}
