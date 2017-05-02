//
//  ALKCalculator.swift
//  Alcoholic
//
//  Created by Admin on 28/03/2017.
//  Copyright © 2017 home. All rights reserved.
//

import Foundation

enum IntoxicationStage: Double {
    case low = 0.5
    case middle = 1.0
    case hard = 2.0
}

enum AlcoType: Double {
    case Beer = 0.05
    case Wine = 0.15
    case Spirit = 0.4
}

struct Constants {
    enum GenderWaterPercentage: Double {
        case Man = 0.65
        case Woman = 0.6
    }
    static let PercentageOfSpirit = 0.9
    static let SpiritDensity = 0.79
    static let millilitresInLitre = 1000.0
}

struct ALKPack {
    var spiritsLitres:  Double
    var wineLitres:     Double
    var beerLitres:     Double
    
    init(_ spirits: Double = 0.0,_ wines: Double = 0.0,_ beers: Double = 0.0) {
        spiritsLitres = spirits
        wineLitres = wines
        beerLitres = beers
    }
}

class ALKCalculator {
    
    var strongPack = ALKPack()
    var mixedPack = ALKPack()
    var lightPack = ALKPack()
    
    static let sharedInstance = ALKCalculator()
    
    func calculatePacksForMen(_ menCount: Double, withAvagageWeight manWeight: Double, forWomen womenCount: Double, withAvarageWeight womanWeight: Double, andIntoxication intoxicationStage: IntoxicationStage) {
        
        strongPack.spiritsLitres = menCount * getDesiredLitersForType(.Spirit, weight: manWeight, withIntoxication: intoxicationStage, inMix: false, forMan: true) + womenCount * getDesiredLitersForType(.Spirit, weight: womanWeight, withIntoxication: intoxicationStage, inMix: false, forMan: false)
        
        mixedPack.spiritsLitres = menCount * getDesiredLitersForType(.Spirit, weight: manWeight, withIntoxication: intoxicationStage, inMix: true, forMan: true)
        mixedPack.beerLitres = menCount * getDesiredLitersForType(.Beer, weight: manWeight, withIntoxication: intoxicationStage, inMix: true, forMan: true)
        mixedPack.wineLitres = womenCount * getDesiredLitersForType(.Wine, weight: womanWeight, withIntoxication: intoxicationStage, inMix: false, forMan: false)
        
        lightPack.beerLitres = menCount * getDesiredLitersForType(.Beer, weight: manWeight, withIntoxication: intoxicationStage, inMix: false, forMan: true)
        lightPack.wineLitres = womenCount * getDesiredLitersForType(.Wine, weight: womanWeight, withIntoxication: intoxicationStage, inMix: false, forMan: false)
    }
    
    private func getDesiredLitersForType(_ promille: AlcoType, weight: Double, withIntoxication intoxicationStage: IntoxicationStage, inMix mix: Bool, forMan isMan: Bool) -> Double {
        let percentageOfWater = isMan ? Constants.GenderWaterPercentage.Man.rawValue : Constants.GenderWaterPercentage.Woman.rawValue
        let actualIntoxication = mix ? intoxicationStage.rawValue / 2 : intoxicationStage.rawValue
        return (actualIntoxication * weight * percentageOfWater) / (Constants.PercentageOfSpirit * Constants.SpiritDensity * promille.rawValue * Constants.millilitresInLitre)
        }
    
    static func getBottlesFromLitres(_ litres: Double, forAlcoType type: AlcoType) -> Double {
        switch type {
        case .Beer:
            return litres / 0.5
        case .Wine:
            return litres / 0.7
        case .Spirit:
            return litres / 1.0
        }
    }
}
