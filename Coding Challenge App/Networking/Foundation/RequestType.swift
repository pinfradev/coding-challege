//
//  RequestType.swift
//  Images App
//
//  Created by Fray Pineda on 12/2/21.
//

import Foundation
import Alamofire

enum HttpMethod: String {
    case get = "GET"
    case delete = "DELETE"
    case post = "POST"
    case put = "PUT"
}


enum RequestParameter {
        case none
    case json(parameters: Parameters)
}

protocol RequestType {
    var basicUrl: String { get }
    
    var path: String { get }
    
    var method: HttpMethod { get }
    
    var parameters: RequestParameter { get }
    
    var headers: HTTPHeaders? { get }
}
