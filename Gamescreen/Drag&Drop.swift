//
//  Drag&Drop.swift
//  Gamescreen
//
//  Created by Ghaida Farhan on 1/31/24.
//

import ConfettiSwiftUI
import SwiftUI


struct DragAndDropButton: View {
    @State private var isDropped = false
    @State private var counter = 100 // New variable to keep track of confetti
    @State var dropping : ImagesName
    @State var isDroppedRing = true
    @State var isDroppedCup = true
    @State var isDroppedBuilding = true
    @State var isDroppedLaptop = true
    
    
    
    var body: some View {
        ScrollView {
            VStack {
                let columns = [
                    GridItem(.fixed((UIScreen.main.bounds.width / 2) - 20)),
                    GridItem(.fixed((UIScreen.main.bounds.width / 2) - 20))
                ]
                
                LazyVGrid(columns: columns) {
                    ForEach(ImagesName.allCases, id: \.self) { allImage in
                        DraggableView(imageName: allImage)
                    }
                    .background(Color.ourGreen)
                    .cornerRadius(15)
                }
                .padding()
                
                Text("Drag the word and Drop it in the right place")
                    .font(.headline)
                    .bold()
                
                LazyVGrid(columns: columns, spacing: 80) {
                    ForEach(ImagesName.allCases, id: \.self) { Texts in
                        Text(Texts.matching)
                            .padding(20)
                            .background(.ourGreen)
                            .cornerRadius(15)
                            .foregroundColor(.ourBegie)
                            .draggable(Texts.matching )
                    }
                    .padding()
                }
            }
            .padding()
            .confettiCannon(counter: $counter)
        }
    }
    
    private func dragAndDrop() -> Color {
        switch dropping {
        case .imageOne:
            return isDroppedRing ? .ourGreen : .ourBegie
        case .imageTwo:
            return isDroppedLaptop ? .ourGreen : .ourBegie
        case .imageThree:
            return isDroppedCup ? .ourGreen : .ourBegie
        case .imageFour:
            return isDroppedBuilding ? .ourGreen : .ourBegie
        }
    }
}
//    private func CheckingDrop() -> Bool {
//            if let droppedString = items.first {
//                if let imageName = ImagesName(rawValue: droppedString) {
//                    switch imageName {
//                    case .imageOne:
//                        isDroppedRing = AllImages.matching == Texts.matching
//                    case .imageTwo:
//                        isDroppedLaptop = imageName.matching == image.matching
//                    case .imageThree:
//                        isDroppedCup = imageName.matching == image.matching
//                    case .imageFour:
//                        isDroppedBuilding = imageName.matching == image.matching
//                    }
//                    return true
//                }
//            }
//            return false
//        }
    

struct DragAndDropButton_Previews: PreviewProvider {
    static var previews: some View {
        DragAndDropButton( dropping: .allCases.randomElement() ?? .imageOne)
    }
}

