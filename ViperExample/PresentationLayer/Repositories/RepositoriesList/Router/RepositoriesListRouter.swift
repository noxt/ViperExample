//
//  Created by Dmitry Ivanenko on 17/11/2016.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import UIKit


class RepositoriesListRouter {
  
}


// MARK: - RepositoriesListRouterInput

extension RepositoriesListRouter: RepositoriesListRouterInput {
  
  func openDetails(fromViewController viewController: UIViewController, repositoryID id: Int) {
    RepositoryDetailsModule.create().present(fromViewController: viewController, repositoryID: id)
  }
  
}
