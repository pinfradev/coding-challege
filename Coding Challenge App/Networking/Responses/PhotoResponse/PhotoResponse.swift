//
//  PhotoResponse.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 12/2/21.
//

import Foundation

struct PhotoResponse: Codable {
    var documentId: String?
    var id: String
    var urls: UrlModel?
    var likes: Int?
    var user: User?
    var description: String?
}

struct UrlModel: Codable {
    var raw: String?
    var full: String?
    var regular: String?
    var small: String?
    var thumb: String?
}
