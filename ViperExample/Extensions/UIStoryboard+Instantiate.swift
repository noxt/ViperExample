//
//  Created by Dmitry Ivanenko on 17.11.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import UIKit


extension UIStoryboard {
  
  static func instantiate<T: UIViewController>(type: T.Type) -> T {
    return UIStoryboard(name: String(describing: T.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: T.self)) as! T
  }
  
}
