//
//  Created by Dmitry Ivanenko on 17.11.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import UIKit


class ApplicationConfigurator: ConfiguratorProtocol {
  
  func configure() {
    AppDelegate.currentWindow.rootViewController = UINavigationController(rootViewController: RepositoriesListModule.create().viewController)
  }
  
}
