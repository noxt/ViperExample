//
//  Created by Dmitry Ivanenko on 17.11.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift


extension Repository: StaticMappable {
  
  static func objectForMapping(map: Map) -> BaseMappable? {
    return Cache.default.load(byPK: map.JSON["id"]) as Repository
  }
  
  mutating func mapping(map: Map) {
    id <- map["id"]
    name <- map["name"]
    lang <- map["language"]
  }
  
}
