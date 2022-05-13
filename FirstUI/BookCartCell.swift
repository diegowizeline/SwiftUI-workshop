//
//  BookCartCell.swift
//  FirstUI
//
//  Created by Juan Enriquez on 12/05/22.
//

import SwiftUI

struct BookCartCellView: View {
    var body: some View {
        HStack(spacing: 20) {
            Image("lordBook")
                .resizable()
                .frame(width: 60, height: 100)
                .cornerRadius(10)
                .shadow(color: Color.gray.opacity(0.6), radius: 10, x: 10, y: 15)
            VStack(alignment: .leading, spacing: 16) {
                Text("The two towers")
                    .font(.subheadline)
                Text("$19.99")
                    .fontWeight(.bold)
            }
            Text("x1")
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.gray, lineWidth: 1)
                )
            Spacer()
        }
    }
}

struct BookCartCellView_Previews: PreviewProvider {
    static var previews: some View {
        BookCartCellView()
    }
}
