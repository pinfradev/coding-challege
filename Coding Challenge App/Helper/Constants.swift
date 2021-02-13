//
//  Constants.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 13/2/21.
//

import Foundation
import UIKit

enum FontType: String {
    case roboto = "Roboto"
}

enum FontWeight: String {
    case bold = "Bold"
    case light = "Light"
    case medium = "Medium"
    case regular = "Regular"
}
struct Constants {
    
    struct Strings {
        
        struct Alerts {
            static var accept = NSLocalizedString("Alerts.acept", comment: "")
        }
        
        struct Home {
            static var mainTitle = NSLocalizedString("Home.main_title", comment: "")
        }
    }
    
    struct CellIdentifier {
        static let photoCollectionView = "PhotoCollectionViewCell"
    }
}

struct Fonts {
    static func getFont(type: FontType, weight: FontWeight, size: CGFloat) -> UIFont {
        switch type {
        case .roboto:
            return UIFont(name: "\(type.rawValue)-\(weight.rawValue)",
                          size: size) ?? UIFont()
        }
    }
}
