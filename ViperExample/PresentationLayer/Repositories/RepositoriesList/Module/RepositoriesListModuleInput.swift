//
//  Created by Dmitry Ivanenko on 17/11/2016.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import UIKit


protocol RepositoriesListModuleInput: class {
  var output: RepositoriesListModuleOutput? { get set }
  var viewController: UIViewController { get }
}
