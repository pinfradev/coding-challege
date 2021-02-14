//
//  BaseViewController.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 12/2/21.
//

import UIKit

class BaseViewController: UIViewController {
    
    private var loader: UIActivityIndicatorView {
        let loader = UIActivityIndicatorView(frame: self.view.frame)
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
