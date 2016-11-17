//
//  Created by Dmitry Ivanenko on 17.11.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import RealmSwift


class RealmRepository: Object {
  
  dynamic var id = 0
  dynamic var name = ""
  dynamic var lang = ""
  
  
  override class func primaryKey() -> String? {
    return "id"
  }
  
}
