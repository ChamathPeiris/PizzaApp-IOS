//
//  PizzaModel.swift
//  Pizza
//
//  Created by Chamath Peiris on 2022-05-10.
//

import Foundation

struct PizzaModel: Codable {
    var id: UUID
    var name: String
    var ingredients: String
    var imageName: String
    var thumbnailName: String
    var type: PizzaType.RawValue
}

//set necessary data types as enums
enum PizzaType: String, Codable {
    case all = "all"
    case meat = "meat"
    case vegetarian = "veggie"
}
