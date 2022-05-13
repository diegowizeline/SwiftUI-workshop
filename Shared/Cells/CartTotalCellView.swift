//
//  CartTotalCellView.swift
//  Swift-Workshop-Diego
//
//  Created by Diego Herrera Rivera on 13/05/22.
//

import SwiftUI

struct CartTotalCellView: View {
    @Binding private var jiggling: Bool
    @Binding private var jiggling_counter: Int
    @Binding private var rotation_angle: Int
    private var scale_effect: Double
    private let rotation_angle_base: Int
    
    init(jiggling: Binding<Bool>, jiggling_counter:Binding<Int>, rotation_angle:Binding<Int>, scale_effect: Double, rotation_angle_base: Int) {
        self._jiggling = jiggling
        self._jiggling_counter = jiggling_counter
        self._rotation_angle = rotation_angle
        self.scale_effect = scale_effect
        self.rotation_angle_base = rotation_angle_base
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Image("cart")
                .resizable()
                .frame(width: 60, height: 60)
                .rotationEffect(.degrees(jiggling ? Double(rotation_angle) : 0))
                .scaleEffect(jiggling ? scale_effect : 1)
                .animation(.linear(duration: 0.15), value: jiggling)
            
            VStack(alignment: .leading) {
                Text("Total")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .opacity(0.7)
                Text("$19.99")
                    .fontWeight(.bold)
                    .font(.largeTitle)
            }
            Spacer()
        }
    }
}

struct CartTotalCellView_Previews: PreviewProvider {
    static var previews: some View {
        CartTotalCellView(jiggling: .constant(false), jiggling_counter: .constant(0), rotation_angle: .constant(0), scale_effect: 1.2, rotation_angle_base: 15)
    }
}
