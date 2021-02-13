//
//  BaseViewController.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 12/2/21.
//

import UIKit

class BaseViewController: UIViewController {
    
    var loader: UIActivityIndicatorView {
        let loader = UIActivityIndicatorView(frame: self.view.bounds)
        loader.hidesWhenStopped = true
        loader.stopAnimating()
        loader.style = .large
        loader.tintColor = .blue
        return loader
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func showBasicLoader() {
        self.view.addSubview(loader)
        view.bringSubviewToFront(loader)
        self.loader.startAnimating()
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
    

}
