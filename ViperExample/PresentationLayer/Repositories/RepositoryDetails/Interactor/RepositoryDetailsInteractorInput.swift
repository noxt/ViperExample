//
//  Created by Dmitry Ivanenko on 17/11/2016.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import Foundation


protocol RepositoryDetailsInteractorInput: class {
  
  func loadModel(forRepositoryID id: Int)
  func save(repository: Repository)
  
}
