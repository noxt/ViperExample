//
//  Created by Dmitry Ivanenko on 17.11.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import RealmSwift


class Cache {
  
  static let `default` = Cache()
  
  private init() { }
  
  func load<PlainType: RealmMappableProtocol, PKType>(byPK pk: PKType) -> PlainType {
    let realm = try! Realm()
    if let realmObject = realm.object(ofType: PlainType.RealmType.self, forPrimaryKey: pk) {
      return PlainType.mapFromRealmObject(realmObject)
    } else {
      return PlainType()
    }
  }
  
}
