//
//  Created by Dmitry Ivanenko on 17/11/2016.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import UIKit


class RepositoryDetailsPresenter {
  weak var output: RepositoryDetailsModuleOutput?
  weak var view: RepositoryDetailsViewInput!
  var interactor: RepositoryDetailsInteractorInput!
  var router: RepositoryDetailsRouterInput!
  
  fileprivate var repositoryID: Int!
  fileprivate var repository: Repository? {
    didSet {
      guard let repository = repository else {
        return
      }
      
      view.show(content: repository.name)
    }
  }
}


// MARK: - RepositoryDetailsViewOutput

extension RepositoryDetailsPresenter: RepositoryDetailsViewOutput {
    
  func viewIsReady() {
    view.setupInitialState()
    interactor.loadModel(forRepositoryID: repositoryID)
  }
  
  func appendToRepository() {
    guard let repository = repository else {
      return
    }
    
    var updatedRepository = repository
    updatedRepository.name = updatedRepository.name + "!"
    interactor.save(repository: updatedRepository)
  }

}


// MARK: - RepositoryDetailsInteractorOutput

extension RepositoryDetailsPresenter: RepositoryDetailsInteractorOutput {
  
  func didRecieve(repository: Repository) {
    self.repository = repository
  }
  
}


// MARK: - RepositoryDetailsModuleInput

extension RepositoryDetailsPresenter: RepositoryDetailsModuleInput {
  
  func present(fromViewController viewController: UIViewController, repositoryID id: Int) {
    repositoryID = id
    view.present(fromViewController: viewController)
  }
  
}
