//
//  DraggableView.swift
//  Gamescreen
//
//  Created by Ghaida Farhan on 2/5/24.
//

import SwiftUI

struct DraggableView: View {
    @State private var counter = 100
    @State private var isDropped = false
    @State private var textLabel = "\t\t\t"
    @State private var showAlert = false
    
    var imageName: ImagesName
    
    var body: some View {
        VStack {
            Image(imageName.rawValue)
                .resizable()
                .frame(width:80, height: 100)
                .padding(30)
            
            HStack {
                if !isDropped {
                    // Show the draggable text only if the item is not dropped
                    Text(textLabel)
                        .padding(12)
                        .background(isDropped ? .ourGreen : .ourBegie)
                        .foregroundColor(.ourBegie)
                        .cornerRadius(8)
                        .shadow(radius: 1.0)
                        .dropDestination(for: String.self) { items, location in
                            if !isDropped {
                                if let droppedString = items.first {
                                    if let iName = ImagesName(rawValue: droppedString) {
                                        if iName.matching == imageName.matching {
                                            textLabel = iName.matching
                                            isDropped = true
                                            counter += 1 // Increment confetti counter
                                            // TODO: make the draggable text disappear when it's dropped
                                        } else {
                                            if !isDropped {
                                                // Handle incorrect drop..
                                                showAlert = true
                                            }
                                        }
                                    }
                                }
                            }
                            return true
                        }
                        .opacity(isDropped ? 0 : 1) // Make the draggable text disappear when it's dropped
                }
            }
            .padding()
            .alert("Oops, wrong answer ..", isPresented: $showAlert){
            } message: {
                Text("It's all about finding the right answer,keep trying!")
                    .bold()
            }
        }
        .padding(1)
        .confettiCannon(counter: $counter, num: 50)
    }
}

struct DraggableView_Previews: PreviewProvider {
    static var previews: some View {
        DraggableView(imageName: .imageTwo)
    }
}
