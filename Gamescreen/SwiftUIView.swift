//
//  SwiftUIView.swift
//  Gamescreen
//
//  Created by Ghaida Farhan on 2/1/24.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var isDropped = false
    @State private var droppedText: String?
    @State var dropping : ImagesName
    var body: some View {
        ZStack{
            
            VStack{
                Image("ring")
                    .resizable()
                    .frame(width:150, height:180)
                    .padding()
               
                    Text("\t\t\t")
                        .padding(20)
                        .background(isDropped ? .ourGreen : .ourBegie)
                        .foregroundColor(.ourBlue)
                        .cornerRadius(15)
                        .dropDestination(for: String.self) { items, location in
                            if let droppedString = items.first {
                                droppedText = "\(droppedString)"
                                isDropped = true
                        }
          return true
         }
              }
            } .padding(40)
              .background(.ourGreen)
              .cornerRadius(15)
            
        Text(dropping.matching)
            .padding(20)
            .background(.ourGreen)
            .cornerRadius(15)
            .foregroundColor(.ourBegie)
            .draggable(dropping.matching)
        
    }
    }

#Preview {
    SwiftUIView(dropping: .imageOne)
}
