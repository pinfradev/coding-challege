//
//  MainLabelView.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 13/2/21.
//

import UIKit

class MainLabelView: UIView {
    //MARK: IBOutlets
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var contentView: UIView!
    override init(frame: CGRect) {
        //For using custom view in code
        super.init(frame: frame)
        self.commonInit()
        
    }
    
    required init?(coder: NSCoder) {
        //For using custom in IB
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("\(MainLabelView.self)", owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
    }
    
    func setupLabelText(with text: String) {
        let attributedText = NSAttributedString(string: text,
                                                attributes: [NSAttributedString.Key.font: Fonts.getFont(type: .roboto,
                                                                                                        weight: .bold,
                                                                                                        size: 15.0)])
        self.label.attributedText = attributedText
        self.label.sizeToFit()
    }
}
