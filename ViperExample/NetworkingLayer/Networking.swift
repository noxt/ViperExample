//
//  Created by Dmitry Ivanenko on 17.11.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper


struct Networking {
  
  static func requestJSON<ResultType: BaseMappable>(_ request: URLRequestConvertible, completion: @escaping (Result<ResultType>) -> Void) {
    Alamofire.request(request)
      .validate()
      .responseString {
        response in
        
        switch response.result {
        case .success(let jsonString):
          if let mappedObject = ResultType(JSONString: jsonString) {
            completion(.success(mappedObject))
          } else {
            completion(.failure(NetworkError.mappingError))
          }
        case .failure(let error):
          completion(.failure(NetworkError.customError(title: error.localizedDescription, message: error.localizedDescription)))
        }
    }
  }
  
}
