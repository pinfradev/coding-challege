//
//  ContactResource.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 14/2/21.
//

import Foundation
import Alamofire

enum ContactResource {
    case contact(request: ContactRequest)
}

extension ContactResource: RequestType  {
    var basicUrl: String {
        return "https://nube11.com/bamfit"
    }
    
    var path: String {
        return "/node?_format=json"
    }
    
    var method: HttpMethod {
        return .post
    }
    
    var parameters: RequestParameter {
        switch self{
            case .contact(let requestObject) :
                let dict = [
                    "type": [[
                        "target_id": "contacto"
                    ]],
                    "field_nombre_completo": [[
                        "value": requestObject.name
                    ]],
                    "field_fecha_de_nacimiento": [[
                        "value": requestObject.date
                    ]],
                    "field_correo_electronico": [[
                        "value": requestObject.email
                    ]],
                    "field_mensaje": [[
                        "value": requestObject.message
                    ]]
                    
                ]
                return .json(parameters: dict)
        }
    }
    
    var headers: HTTPHeaders? {
        return [
            "Accept": "application/hal+json"
        ]
    }
 
}
