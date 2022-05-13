//
//  CartView.swift
//  FirstUI
//
//  Created by Juan Enriquez on 12/05/22.
//

import SwiftUI

struct CartView: View {
    @Binding var showModal: Bool
    @State var showingAlert = false
    @State var jiggling = false
    @State var jiggling_counter = 0
    
    var scale_effect = 1.2
    let rotation_angle_base = 15
    @State private var rotation_angle = 0
    
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
                BookCartCellView()
                    .frame(width: 300)
                    .rotationEffect(.degrees(jiggling ? Double(rotation_angle) : 0))
                    .scaleEffect(jiggling ? scale_effect : 1)
                    .animation(.linear(duration: 0.15), value: jiggling)
                CartTotalCellView()
                    .frame(width: 300)
                    .rotationEffect(.degrees(jiggling ? Double(rotation_angle) : 0))
                    .scaleEffect(jiggling ? scale_effect : 1)
                    .animation(.linear(duration: 0.15), value: jiggling)
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
                        //jiggle_shipping_icon(apply_delay: true)
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
