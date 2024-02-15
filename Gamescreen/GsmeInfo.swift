//
//  GsmeInfo.swift
//  Gamescreen
//
//  Created by Ghaida Farhan on 1/31/24.
//

import Foundation
protocol AllImages  {
    var name : String { get }
    var droppedText : String { get }
//    var isDropped: Bool
}
var isDroppedRing = true
var isDroppedLaptop = true
var isDroppedBuilding = true
var isDroppedCup = true


enum ImagesName :String, CaseIterable{
    case imageOne = "Ring"
    case imageTwo = "Laptop"
    case imageThree = "Cup"
    case imageFour = "Building"
    
    var matching:String{
        switch self{
            
        case .imageOne:
            return "Ring"
        case .imageTwo:
            return "Laptop"
        case .imageThree:
            return "Cup"
        case .imageFour:
            return "Building"
        }
    }
    var droppedValue: Bool {
        switch self{
            
        case .imageOne:
            var isDroppedRing = true
            return true
        case .imageTwo:
            var isDroppedLaptop = true
            return true
        case .imageThree:
            var isDroppedCup = true
            return true
        case .imageFour:
            var isDroppedBuilding = true
            return true
        }
    }
}

struct appInfo : AllImages {
    var droppedText: String
    var name: String
    
}



