//
//  Created by Dmitry Ivanenko on 17/11/2016.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import RealmSwift


class RepositoryDetailsInteractor {

  weak var output: RepositoryDetailsInteractorOutput!
  
  fileprivate var filteredRepositories: Results<RealmRepository>? {
    didSet {
      notificationToken?.stop()
      notificationToken = filteredRepositories?.addNotificationBlock {
        [weak self] (changes: RealmCollectionChange) in
        
        guard let `self` = self, let repository = self.filteredRepositories?.first else {
          return
        }
        
        self.output.didRecieve(repository: Repository.mapFromRealmObject(repository))
      }
    }
  }
  fileprivate var notificationToken: NotificationToken?
  
  
  deinit {
    notificationToken?.stop()
  }

}


// MARK: - RepositoryDetailsInteractorInput

extension RepositoryDetailsInteractor: RepositoryDetailsInteractorInput {
  
  func loadModel(forRepositoryID id: Int) {
    let realm = try! Realm()
    filteredRepositories = realm.objects(RealmRepository.self).filter("id == \(id)")
  }
  
  func save(repository: Repository) {
    let realm = try! Realm()
    try! realm.write {
      realm.add(repository.mapToRealmObject(), update: true)
    }
  }
  
}
