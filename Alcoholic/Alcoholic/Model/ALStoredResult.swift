//
//  ALStoredResult.swift
//  Alcoholic
//
//  Created by Admin on 19/03/2017.
//  Copyright © 2017 home. All rights reserved.
//
import Foundation
import RealmSwift

class ALStoredResult: Object {
    dynamic var date = Date()
    dynamic var alcoholDescription = [String : Int]()
    dynamic var conditionDescription = [String : Int]()
}
