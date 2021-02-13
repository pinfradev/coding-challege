//
//  LocalDataManager.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 13/2/21.
//

import Foundation

class LocalDataManager {
    
    private let manager = CoreDataManager()
    
    func saveLocalPhoto(photo: PhotoModel) {
        manager.savePhoto(photo: photo)
    }
}
