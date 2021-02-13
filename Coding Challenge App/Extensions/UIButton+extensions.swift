//
//  UIButton+extensions.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 13/2/21.
//

import Foundation
import UIKit

extension UIButton {
    
    func setAttributedTitleWith(text: String,
                                fontType: FontType,
                                weight: FontWeight,
                                size: Double) {
        let attributedString = NSAttributedString(string: text,
                                                  attributes: [NSAttributedString.Key.font: Fonts.getFont(type: fontType,
                                                                                                          weight: weight,
                                                                                                          size:CGFloat(size))])
        self.setAttributedTitle(attributedString, for: .normal)
    }
}
