//
//  Created by Dmitry Ivanenko on 17/11/2016.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import UIKit


protocol RepositoriesListViewOutput: class {
  func viewIsReady()
  func openDetails(forRepository repository: Repository)
}
