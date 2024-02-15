//
//  Drop2.swift
//  Gamescreen
//
//  Created by Ghaida Farhan on 2/1/24.
//
import SwiftUI

enum Native: CaseIterable {
    case Arabic , Bengali, French , Pourtuges
}


struct BeforeStarting: View {
    @State var languages : Native
    var body: some View {
        ZStack{
           
                Image("Background")
                    .resizable()
                    .ignoresSafeArea()
                    
            VStack{
                Text("Before we start..")
                    .font(Font.custom("Merriweather-BoldItalic", size: 25))
                    .foregroundColor(.ourBlue)
                
                Spacer()
                
                Text("Select Your Native language:")
                    .font(Font.custom("Merriweather-BoldItalic", size: 25))
                    .foregroundColor(.ourBlue)
                
                Form {
                   Picker("Language", selection: $languages) {
                       ForEach(Native.allCases, id: \.self) {native in
                               Text("\(native)".capitalized).tag(native)}
                       .foregroundColor(.ourBegie)
                           
                            
                   }
                   .pickerStyle(DefaultPickerStyle()).background(.ourGreen)
                       
                }
                
            }
            
        }
        
    }
}
#Preview {
    BeforeStarting(languages: .Arabic)
}
