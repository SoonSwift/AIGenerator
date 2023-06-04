//
//  Styles.swift
//  ArtGenerator
//
//  Created by Marcin Dytko on 30/05/2023.
//

import Foundation

enum ImageStyle: String, CaseIterable {
    case none
    case abstract = "abstract"
    case cartoon
    case comic
    case expressionsim
    case popArt = "pop art"
    case realism
    case horror
    
    var description: String {
        self != .none ? "an image in style of" + self.rawValue + " " : " "
    }
}

enum ImageMedium: String, CaseIterable {
    case none
    case digital = "digital art"
    case oil = "oil painting"
    case pastle
    case photo
    
    var description: String {
        self != .none ? " in medium of" + self.rawValue + " " : " "
    }
}

enum Artist: String, CaseIterable {
    case none
    case dali = "Salvador Dali"
    case hieronim =  "Bosh Hieronim"
    
    
    var description: String {
        self != .none ? "an image in style of" + self.rawValue + " " : " "
    }
}
