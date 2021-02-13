//
//  ImageAPI.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 12/2/21.
//

import Foundation

class ImageAPI: APIBasis<ImageResource> {
    
    private static var sharedImageAPI: ImageAPI = {
        let imageApi = ImageAPI()
        return imageApi
    }()
    
    class func shared() -> ImageAPI {
        return self.sharedImageAPI
    }
    
    func getAllImages(page: Int,
                      perPage: Int,
                      completion: @escaping (Result<[PhotoResponse], NSError>) -> Void) {
        self.basicRequest(requestType: .getImages(pag: page,
                                                  perPage: perPage),
                                                  responseClass: [PhotoResponse].self) { (result) in
            
            switch result {
            case .success(let photoModel):
                completion(.success(photoModel))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
}
