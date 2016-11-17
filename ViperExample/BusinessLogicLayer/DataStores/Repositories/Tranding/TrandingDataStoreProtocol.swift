//
//  Created by Dmitry Ivanenko on 17.11.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import RealmSwift


protocol TrandingDataStoreProtocol {
  func top(forLang lang: Lang) -> Results<RealmRepository>
}
