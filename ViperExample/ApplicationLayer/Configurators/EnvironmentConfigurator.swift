//
//  Created by Dmitry Ivanenko on 17.11.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import Foundation


class EnvironmentConfigurator: ConfiguratorProtocol {
  
  func configure() {
    AppDelegate.currentDelegate.environment = ExternalServerEnvironment()
  }
  
}
