//
//  Created by Dmitry Ivanenko on 17/11/2016.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import UIKit


protocol RepositoriesListRouterInput: class {

  func openDetails(fromViewController viewController: UIViewController, repositoryID id: Int)
  
}
