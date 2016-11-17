//
//  Created by Dmitry Ivanenko on 17.11.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import Foundation


class ExternalServerEnvironment: EnvironmentProtocol {
  
  let baseUrl = "https://api.github.com"
  
  var searchBaseUrl: String {
    return baseUrl + "/search"
  }
  
}
