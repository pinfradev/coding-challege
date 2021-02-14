//
//  ContactAPI.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 14/2/21.
//

import Foundation

class ContactAPI: APIBasis<ContactResource> {
    
    static let sharedAPI: ContactAPI = ContactAPI()
    
    func sendContactMessage(request: ContactRequest,
                            completion: @escaping (Result<ContactResponse, NSError>) -> Void){
        self.basicRequest(requestType: .contact(request: request),
                    responseClass: ContactResponse.self) { (response) in
            switch response {
            case .success(let object):
                completion(.success(object))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
