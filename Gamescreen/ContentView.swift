//
//  ContentView.swift
//  Gamescreen
//
//  Created by Asif on 1/30/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack{
            Image("Background")
                .resizable()
                .frame(width:500)
                .ignoresSafeArea()
            VStack{
                DragAndDropButton(dropping: .imageOne)
            }
        }
    }
}

#Preview {
    ContentView()
}
