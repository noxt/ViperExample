//
//  Created by Dmitry Ivanenko on 17.11.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import RealmSwift


protocol RealmMappableProtocol {
  
  associatedtype RealmType: Object
  
  init()
  func mapToRealmObject() -> RealmType
  static func mapFromRealmObject(_ object: RealmType) -> Self
  
}
