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
            static let accept = NSLocalizedString("Alerts.acept", comment: "")
        }
        
        struct Home {
            static let mainTitle = NSLocalizedString("Home.main_title", comment: "")
        }
        
        struct ImageDetail {
            static let mainTitle = NSLocalizedString("ImageDetail.mainTitle", comment: "")
            static let ImageIdTitle = NSLocalizedString("ImageDetail.imageIdTitle", comment: "")
            static let userNameTitle = NSLocalizedString("ImageDetail.userNameTitle", comment: "")
            static let bioTitle = NSLocalizedString("ImageDetail.bioTitle", comment: "")
            static let mainButtonTitle = NSLocalizedString("ImageDetail.mainButtonTitle", comment: "")
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
                          size: size) ?? .systemFont(ofSize: size)
            
        }
    }
}
