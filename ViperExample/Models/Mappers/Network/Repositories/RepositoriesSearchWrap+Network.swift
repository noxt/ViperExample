//
//  Created by Dmitry Ivanenko on 17.11.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import ObjectMapper


extension RepositoriesSearchWrap: StaticMappable {
  
  static func objectForMapping(map: Map) -> BaseMappable? {
    return RepositoriesSearchWrap()
  }
  
  mutating func mapping(map: Map) {
    items <- map["items"]
  }
  
}
