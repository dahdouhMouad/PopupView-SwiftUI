//
//  ContentView.swift
//  PopUpSwiftUI
//
//  Created by Macbook Pro on 20/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Button {
                    isActive = true
                } label: {
                    Text("Click me")
                        .foregroundColor(.accentColor)
                }
            }
            .padding()
            
            if isActive {
                PopupView(isActive: $isActive, title: "Accès aux contacts", subTitle: "Accès aux contacts", buttonTitle: "OK") {
                    print("Pop Clicked")
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
