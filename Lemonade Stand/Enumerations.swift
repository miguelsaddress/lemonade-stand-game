//
//  Enumerations.swift
//  Lemonade Stand
//
//  Created by Miguel Angel Moreno Armenteros on 27/10/14.
//  Copyright (c) 2014 Miguel Angel Moreno Armenteros. All rights reserved.
//

import Foundation

enum Weather:Int, Printable {
    case Cold = 0
    case Warm = 1
    case Mild = 2;
    
    var description : String {
        get {
            switch (self){
            case .Cold:
                return "Cold"
            case .Warm:
                return "Warm"
            default:
                return "Mild"
            }
        }
    }
    
    init(rawValue: Int){
        self = Weather.fromRaw(rawValue)!
    }
    
    
}

enum LemonadeTaste: String, Printable {
    case Acidic = "Acidic"
    case Neutral = "Neutral"
    case Diluted = "Diluted"
    
    var description : String {
        get {
            switch (self){
            case .Acidic:
                return "Acidic"
            case .Neutral:
                return "Neutral"
            default:
                return "Diluted"
            }
        }
    }
    
}