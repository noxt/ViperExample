//
//  Created by Dmitry Ivanenko on 17.11.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import RealmSwift


extension Repository: RealmMappableProtocol {
  
  static func mapFromRealmObject(_ object: RealmRepository) -> Repository {
    var model = Repository()
    
    model.id = object.id
    model.name = object.name
    model.lang = Lang(rawValue: object.lang)
    
    return model
  }
  
  func mapToRealmObject() -> RealmRepository {
    let model = RealmRepository()
    
    model.id = id
    model.name = name
    model.lang = lang.rawValue
    
    return model
  }
  
}
