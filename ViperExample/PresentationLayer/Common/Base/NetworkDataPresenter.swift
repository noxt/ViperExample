//
//  Created by Dmitry Ivanenko on 17.11.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import UIKit


class NetworkDataPresenter: NetworkErrorPresenterProtocol {
  
  func didRecieve(error: NetworkError) {
    let alert = UIAlertController(title: error.title, message: error.message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    AppDelegate.currentWindow.rootViewController?.present(alert, animated: true, completion: nil)
  }
  
}
