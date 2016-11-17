//
//  Created by Dmitry Ivanenko on 17.11.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var environment: EnvironmentProtocol!
  fileprivate lazy var configurators: [ConfiguratorProtocol] = [
    EnvironmentConfigurator(),
    ThirdPartiesConfigurator(),
    ApplicationConfigurator()
  ]


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    
    for configurator in configurators {
      configurator.configure()
    }
    
    return true
  }

}


extension AppDelegate {
  
  static var currentDelegate: AppDelegate {
    return UIApplication.shared.delegate as! AppDelegate
  }
  
  static var currentWindow: UIWindow {
    return currentDelegate.window!
  }
  
  static var currentEnvironment: EnvironmentProtocol {
    return currentDelegate.environment
  }
  
}
