//
//  CartView.swift
//  Swift-Workshop-Diego
//
//  Created by Diego Herrera Rivera on 13/05/22.
//

import Foundation
import SwiftUI

struct CartView: View {
    @Binding var showModal: Bool
    @State var showingAlert = false
    @State var jiggling = false
    @State var jiggling_counter = 0
    @State private var rotation_angle = 0
    
    private var scale_effect = 1.2
    private let rotation_angle_base = 15
    
    init(showModal: Binding<Bool>) {
        self._showModal = showModal
    }

    var body: some View {
        NavigationView {
            VStack() {
                Text("Your bag")
                    .font(.largeTitle)
                Text("1 items")
                    .foregroundColor(.gray)
                    .opacity(0.7)
                BookCartCellView(jiggling: $jiggling, jiggling_counter: $jiggling_counter, rotation_angle: $rotation_angle, scale_effect: scale_effect, rotation_angle_base: rotation_angle)
                    .padding([.horizontal], 50)
                CartTotalCellView(jiggling: $jiggling, jiggling_counter: $jiggling_counter, rotation_angle: $rotation_angle, scale_effect: scale_effect, rotation_angle_base: rotation_angle)
                    .padding([.horizontal], 50)
                Divider()
                    .padding()
                Button("Checkout") {
                    showingAlert.toggle()
                }
                .frame(width: 200)
                .padding()
                .foregroundColor(.white)
                .background(Color.yellow)
                .cornerRadius(40)
            }
            .toolbar {
                Button("🅧") {
                    showModal = false
                }
            }
        }
        .onAppear() {
            jiggle_shipping_icon(apply_delay: true)
        }
        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("Order confirmed"),
                                  message: Text("Thank you for your purchase."),
                                  dismissButton: .default(Text("Done")) {
                                self.showModal.toggle()
                               
                            })
                        }
    }
    
    func jiggle_shipping_icon(apply_delay: Bool) {
            DispatchQueue.main.asyncAfter(deadline: .now() + (apply_delay ? 1 : 0)) {
                withAnimation() {
                    jiggling.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                    withAnimation() {
                        jiggling.toggle()
                    }
                    jiggling_counter += 1
                    
                    if(jiggling_counter == 4){
                        jiggling_counter = 0
                        rotation_angle = -rotation_angle_base
                    } else {
                        if(rotation_angle < 0){
                            rotation_angle = rotation_angle_base
                        } else {
                            rotation_angle = -rotation_angle_base
                        }
                        jiggle_shipping_icon(apply_delay: false)
                    }
                }
            }
        }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(showModal: .constant(false))
    }
}
