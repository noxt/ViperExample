//
//  Created by Dmitry Ivanenko on 17.11.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import AlamofireNetworkActivityIndicator


class ThirdPartiesConfigurator: ConfiguratorProtocol {
  
  func configure() {
    // NetworkActivityIndicatorManager
    NetworkActivityIndicatorManager.shared.isEnabled = true
  }
  
}
