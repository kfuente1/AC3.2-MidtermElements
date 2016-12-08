//
//  Element .swift
//  AC3.2-MidtermElements
//
//  Created by Karen Fuentes on 12/8/16.
//  Copyright © 2016 Karen Fuentes. All rights reserved.
//

import Foundation
class Element {
    let number: Int
    let weight: Double
    let name : String
    let symbol: String
    var melting_c: Int = 0
    var boiling_c: Int = 0
    var density: Double = 0.0
    var crust_percent: Double = 0.0
    let discovery_year: String
    let group: Int
    var electrons: String = " "
    var ion_energy: Double = 0.0
    
    init? (from dict:[String: Any]){
        guard let number = dict["number"] as? Int else {return nil}
        guard let weight = dict["weight"] as? Double else {return nil}
        guard let name = dict["name"] as? String else {return nil}
        guard let symbol = dict["symbol"] as? String else {return nil}
        guard let discovery_year = dict["discovery_year"] as? String else {return nil}
        guard let group = dict["group"] as? Int else {return nil}
        if let melting_c = dict["melting_c"] as? Int,
            let boiling_c = dict["boiling_c"] as? Int,
            let density = dict["density"] as? Double,
            let crust_percent = dict["crust_percent"] as? Double,
            let electrons = dict["electrons"] as? String,
            let ion_energy = dict["ion_energy"] as? Double {
            self.melting_c = melting_c
            self.boiling_c = boiling_c
            self.density = density
            self.crust_percent = crust_percent
            self.electrons = electrons
            self.ion_energy = ion_energy
        }
        self.number = number
        self.weight = weight
        self.name = name
        self.symbol = symbol
        self.discovery_year = discovery_year
        self.group = group
        
    }
    
    static func parseElements(from array:[[String:Any]]) -> [Element] {
        var arrayOfElements = [Element]()
        for dict in array {
            if let elementOneByOne = Element(from: dict) {
                arrayOfElements.append(elementOneByOne)
            }
        }
        return arrayOfElements
    }
}



//"id": 109,
//"record_url": "https://fieldbook.com/records/5848dead37802c0400b17cd7",
//"number": 109,
//"weight": 268,
//"name": "Meitnerium",
//"symbol": "Mt",
//"melting_c": null,
//"boiling_c": null,
//"density": null,
//"crust_percent": null,
//"discovery_year": "1982",
//"group": 9,
//"electrons": null,
//"ion_energy": null
//}

//"number": 1,
//"weight": 1.0079,
//"name": "Hydrogen",
//"symbol": "H",
//"melting_c": -259,
//"boiling_c": -253,
//"density": 0.09,
//"crust_percent": 0.14,
//"discovery_year": "1776",
//"group": 1,
//"electrons": "1s1",
//"ion_energy": 13.5984
//},
