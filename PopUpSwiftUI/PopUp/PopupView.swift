//
//  PopupView.swift
//  PopUpSwiftUI
//
//  Created by Macbook Pro on 20/11/2023.
//

import SwiftUI

struct PopupView: View {
    @Binding var isActive: Bool
    
    var title: String
    var subTitle: String
    var buttonTitle: String
    let action : () -> ()
    @State private var offset: CGFloat = 1000.0
    
    func close() {
        withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.0)) {
            offset = 1000.0
            isActive = false
        }
    }
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.5)
                .onTapGesture {
                    close()
                }
       
            VStack(spacing: 12) {
                Text(title)
                    .font(.title)
                    .bold()
                    .padding(4)
                
                Text(subTitle)
                    .font(.title3)
                    .padding(4)
                
                Button {
                    action()
                    close()
                } label: {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.red)
                        .overlay {
                            Text(buttonTitle)
                                .foregroundColor(.white)
                                .font(.title3)
                                .bold()
                        }
                }
                .frame(height: 50)
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .background {
                Color.white
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(alignment: .topLeading, content: {
                HStack {
                    Spacer(minLength: 0)
                    Button {
                        close()
                    } label: {
                        Image(systemName: "xmark")
                        
                    }
                    .tint(.black)
                }
                .padding()
            })
            .shadow(radius: 10)
            .offset(x:0, y: offset)
            .onAppear {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.0)) {
                        offset = 0
                        isActive = true
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView(isActive: .constant(true), title: "Accès aux contacts", subTitle: "Accès aux contacts",buttonTitle: "OK") {
            print("here")
        }
    }
}
