//
//  ContactResponse.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 14/2/21.
//

import Foundation

struct ContactResponse: Codable {
    let name: [ContactValue]
    
    enum CodingKeys: String, CodingKey {
        case name = "field_nombre_completo"
    }
}

struct ContactValue: Codable {
    let value: String
}
