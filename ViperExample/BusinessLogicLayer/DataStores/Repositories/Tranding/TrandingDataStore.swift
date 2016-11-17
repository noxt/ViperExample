//
//  Created by Dmitry Ivanenko on 17.11.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import RealmSwift


class TrandingDataStore: TrandingDataStoreProtocol {
  
  func top(forLang lang: Lang) -> Results<RealmRepository> {
    let realm = try! Realm()
    return realm.objects(RealmRepository.self).filter(NSPredicate(format: "lang = %@", lang.rawValue))
  }
  
}
