//
//  ALAlcoholCalculator.swift
//  Alcoholic
//
//  Created by Admin on 20/03/2017.
//  Copyright © 2017 home. All rights reserved.
//

import Foundation

enum IntoxicationStage : Int {
    case low = 0
    case middle = 1
    case hard = 2
}

enum AlcoholType {
    enum SpiritType : String {
        case vodka, brandy, rum, tequila, whiskey, gin
    }
    
    enum WineType : String {
        case tableWine, fortifiedWine, fruitWine, sangria, sparklingWine
    }
    
    enum BeerType : String {
        case ale, fruitBeer, lager, sahti, wheatBeer
    }
}

struct Alcohol {
    let spirit  : (alcohol: AlcoholType.SpiritType, bottles: Int)?
    let beer    : (alcohol: AlcoholType.BeerType,   bottles: Int)?
    let wine    : (alcohol: AlcoholType.WineType,   bottles: Int)?
}



