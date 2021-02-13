//
//  ImageResource.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 12/2/21.
//

import Foundation
import Alamofire

enum ImageResource {
    case getImages(pag: Int, perPage: Int)
}

extension ImageResource: RequestType  {
    var basicUrl: String {
        return "https://api.unsplash.com"
    }
    
    var path: String {
        switch self {
        case .getImages(let page, let perPage):
            return "/photos?page=\(page)&per_page=\(perPage)"
        }
    }
    
    var method: HttpMethod {
        return .get
    }
    
    var parameters: RequestParameter {
        return .none
    }
    
    var headers: HTTPHeaders? {
        return Header.getHeaders()
    }
    
    
}
