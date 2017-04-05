//
//  ALKBottlePack.swift
//  Alcoholic
//
//  Created by Admin on 28/03/2017.
//  Copyright © 2017 home. All rights reserved.
//

import Foundation

struct ALKBottlePack {
    let strongAlcoPack: ALKBottle
    let lowAlcoPack:    ALKBottle
    let mixedAlcoPack:  ALKBottle
    
    func getBottlesAmountForPackType(type : ALKPackType) -> (Int, Int, Int) {
        switch type {
        case .strongAlcoholDrinks:
            return (strongAlcoPack.spiritDrinkAmout, strongAlcoPack.beerAmount, strongAlcoPack.wineAmount)
        case .mixedAlcoholDrinks:
            return (mixedAlcoPack.spiritDrinkAmout, mixedAlcoPack.beerAmount, mixedAlcoPack.wineAmount)
        case .lowAlcoholDrinks:
            return (lowAlcoPack.spiritDrinkAmout, lowAlcoPack.beerAmount, lowAlcoPack.wineAmount)
        }
    }
}

struct ALKBottle {
    let spiritDrinkAmout:   Int
    let beerAmount:         Int
    let wineAmount:         Int
}

enum ALKPackType {
    case strongAlcoholDrinks
    case lowAlcoholDrinks
    case mixedAlcoholDrinks
}

enum IntoxicationStage {
    case low
    case middle
    case hard
}
