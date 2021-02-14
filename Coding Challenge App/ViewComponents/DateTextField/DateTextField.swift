//
//  DateTextField.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 14/2/21.
//

import Foundation
import UIKit

class DateTextField: UITextField {
    let picker = UIDatePicker(frame: CGRect(x: 0,
                                                y: 0,
                                                width: UIScreen.main.bounds.width,
                                                height: 216))
    
    func datePicker<T>(target: T,
                           doneAction: Selector,
                           cancelAction: Selector,
                           datePickerMode: UIDatePicker.Mode = .date) {
        let screenWidth = UIScreen.main.bounds.width
        
        func buttonItem(withSystemItemStyle style: UIBarButtonItem.SystemItem) -> UIBarButtonItem {
            let buttonTarget = style == .flexibleSpace ? nil : target
            let action: Selector? = {
                switch style {
                case .cancel:
                    return cancelAction
                case .done:
                    return doneAction
                default:
                    return nil
                }
            }()
            
            let barButtonItem = UIBarButtonItem(barButtonSystemItem: style,
                                                target: buttonTarget,
                                                action: action)
            
            return barButtonItem
        }
        
        
        let toolBar = UIToolbar(frame: CGRect(x: 0,
                                              y: 0,
                                              width: screenWidth,
                                              height: 44))
        toolBar.setItems([buttonItem(withSystemItemStyle: .cancel),
                          buttonItem(withSystemItemStyle: .flexibleSpace),
                          buttonItem(withSystemItemStyle: .done)],
                         animated: true)
        self.inputAccessoryView = toolBar
   
    }
    func setupDateTextField() {
        picker.datePickerMode = .date
        self.inputView = picker
        self.datePicker(target: self,
                                  doneAction: #selector(doneAction),
                                  cancelAction: #selector(cancelAction),
                                  datePickerMode: .date)
        
  
    }
}

extension DateTextField {
    @objc func cancelAction() {
        self.resignFirstResponder()
    }

    @objc
    func doneAction() {
        if let datePickerView = self.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d/MM/yy"
            let dateString = dateFormatter.string(from: datePickerView.date)
            self.text = dateString
            self.resignFirstResponder()
        }
    }
    
}
    
