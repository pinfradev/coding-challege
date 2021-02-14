//
//  ContactContactViewController.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 14/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

import UIKit

class ContactViewController: BaseViewController, ContactViewInput {
 

    var output: ContactViewOutput!

    //Properties
        let datePicker = UIDatePicker()
    //IBOutlets
    @IBOutlet weak var mainLabelView: MainLabelView! {
        didSet {
            mainLabelView.setupLabelText(with: Constants.Strings.Contact.mainTitle)
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField! {
        didSet {
            nameTextField.placeholder = Constants.Strings.Contact.namePlaceholder
        }
    }
    
    
    @IBOutlet weak var birthDateTextField: DateTextField!{
        didSet {
            self.setupDatePicker()
            birthDateTextField.placeholder = Constants.Strings.Contact.datePlaceholder
        }
    }
    
    
    @IBOutlet weak var emailTextField: UITextField!{
        didSet {
            emailTextField.placeholder = Constants.Strings.Contact.emailPlaceholder
        }
    }
    
    
    @IBOutlet weak var mainButton: UIButton!{
        didSet {
            mainButton.setTitleColor(.white, for: .normal)
            mainButton.backgroundColor = .black
            mainButton.layer.cornerRadius = 16.0
            mainButton.clipsToBounds = true
            mainButton.setTitle(Constants.Strings.Contact.mainBtnTitle, for: .normal)
        }
    }
    
    
    @IBOutlet weak var messageTextView: UITextView!{
        didSet {
            messageTextView.layer.borderWidth = 1.0
            messageTextView.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    
    @IBOutlet weak var messageTitleLabel: UILabel!{
        didSet {
            messageTitleLabel.text = Constants.Strings.Contact.messageTitle
        }
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    //MARK: ContactViewInput
    func showMessage(title: String = "", message: String) {
        self.showAlert(title: title, message: message)
    }
    
    func showLoader() {
        self.showBasicLoader()
    }
    
    func hideLoader() {
        self.hideBasicLoader()
    }
    
    func cleanFields() {
        self.nameTextField.text?.removeAll()
        self.birthDateTextField.text?.removeAll()
        self.emailTextField.text?.removeAll()
        self.messageTextView.text.removeAll()
    }
    
    //MARK:- private funcs
    private func setupDatePicker() {
        
        self.birthDateTextField.setupDateTextField()
    }
    

    
    //MARK: IBActions
    @IBAction func didTapSendMessageBtn() {
        guard let name = self.nameTextField.text,
              let date = self.birthDateTextField.text,
              let email = self.emailTextField.text,
              let message = self.messageTextView.text else {
            return
        }
        
        let requestObject = ContactRequest(name: name,
                                           date: date,
                                           email: email,
                                           message: message)
        self.output.sendInfoToServer(requestObject: requestObject)
    }
}
