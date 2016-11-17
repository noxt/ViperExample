//
//  Created by Dmitry Ivanenko on 17/11/2016.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import UIKit


class RepositoriesListPresenter: NetworkDataPresenter {
  weak var output: RepositoriesListModuleOutput?
  weak var view: RepositoriesListViewInput!
  var interactor: RepositoriesListInteractorInput!
  var router: RepositoriesListRouterInput!
}


// MARK: - RepositoriesListViewOutput

extension RepositoriesListPresenter: RepositoriesListViewOutput {
    
  func viewIsReady() {
    view.setupInitialState()
    interactor.loadSwiftRepositories()
  }
  
  func openDetails(forRepository repository: Repository) {
    router.openDetails(fromViewController: view.viewController, repositoryID: repository.id)
  }

}


// MARK: - RepositoriesListInteractorOutput

extension RepositoriesListPresenter: RepositoriesListInteractorOutput {
  
  func didRecieve(repositories: [Repository]) {
    view.show(repositories: repositories)
  }
  
}


// MARK: - RepositoriesListModuleInput

extension RepositoriesListPresenter: RepositoriesListModuleInput {
  
  var viewController: UIViewController {
    return view.viewController
  }
  
}
