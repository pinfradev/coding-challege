//
//  UILabel+extensions.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 13/2/21.
//

import Foundation
import UIKit

extension UILabel {
    func setTextWith(string: String, font: FontType, weight: FontWeight, size: Double, sizeToFit: Bool = false) {
        let attributedText = NSAttributedString(string: string,
                                                attributes: [NSAttributedString.Key.font: Fonts.getFont(type: font,
                                                                                                        weight: weight,
                                                                                                        size: CGFloat(size))])
        self.attributedText = attributedText
        if sizeToFit {
            self.sizeToFit()
        }
    }
}
