//
//  Created by Dmitry Ivanenko on 17.11.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import Alamofire


class TrandingNetworkService: TrandingNetworkServiceProtocol {
  
  func loadTop(forLang lang: Lang, completion: @escaping (Result<[Repository]>) -> Void) {
    Networking.requestJSON(API.Tranding.repositories(lang: lang)) {
      (result: Result<RepositoriesSearchWrap>)  in
      
      switch result {
      case .success(let response):
        completion(.success(response.items ?? []))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  
}
