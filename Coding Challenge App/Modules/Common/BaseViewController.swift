//
//  BaseViewController.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 12/2/21.
//

import UIKit

class BaseViewController: UIViewController {
    
    private let loader: UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loader.frame = self.view.frame
        loader.hidesWhenStopped = true
        loader.stopAnimating()
        loader.style = .large
    }

    func showBasicLoader() {
        self.loader.isHidden = false
        self.loader.startAnimating()
        self.view.addSubview(loader)
        view.bringSubviewToFront(loader)
    }
    
    func hideBasicLoader() {
        self.loader.stopAnimating()
    }
    
    func showAlert(title: String = "", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: Constants.Strings.Alerts.accept, style: .destructive, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func dismissViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    

}
