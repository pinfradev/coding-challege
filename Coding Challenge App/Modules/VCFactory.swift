//
//  VCFactory.swift
//  Images App
//
//  Created by Fray Pineda on 12/2/21.
//

import Foundation
import UIKit

class VCFactory: NSObject {
    
    enum StoryBoards: String {
        case home = "Home"
        case favorite = "Favorite"
        case imageDetail = "ImageDetail"
        case contact = "Contact"
    }
    
    enum AppVC: Int {
        case home
        case imageDetail
        case favorites
        case contactVC
    }
    
    class func getViewController(_ vc: AppVC) -> UIViewController {
        
        var viewController = UIViewController()
        
        switch vc {
            case .home:
                let viewCtrl = self.instantiateVC(id: "\(HomeViewController.self)",
                                                  storyBoard: .home)
                let nav = CustomNavigationController(rootViewController: viewCtrl)
                viewController = nav
            case .imageDetail:
                break
            case .favorites:
                let viewCtrl = self.instantiateVC(id: "\(FavoriteViewController.self)", storyBoard: .favorite)
                let nav = CustomNavigationController(rootViewController: viewCtrl)
                viewController = nav
                break
        case .contactVC:
            let viewCtrl = self.instantiateVC(id: "\(ContactViewController.self)", storyBoard: .contact)
            let nav = CustomNavigationController(rootViewController: viewCtrl)
            viewController = nav
            
        }
        
        return viewController
    }
    
    class func instantiateVC(id: String, storyBoard: StoryBoards) -> UIViewController {
        let vc = UIStoryboard(name: storyBoard.rawValue, bundle: nil).instantiateViewController(withIdentifier: id)
        return vc
    }
    
    
}
