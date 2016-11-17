//
//  Created by Dmitry Ivanenko on 17/11/2016.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import UIKit


protocol RepositoryDetailsModuleInput: class {
  
  var output: RepositoryDetailsModuleOutput? { get set }
  
  func present(fromViewController viewController: UIViewController, repositoryID id: Int)
  
}
