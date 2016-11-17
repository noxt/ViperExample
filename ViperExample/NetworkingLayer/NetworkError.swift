//
//  Created by Dmitry Ivanenko on 17.11.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import Foundation


enum NetworkError: Error {
  
  case mappingError
  case customError(title: String, message: String?)
  
  
  var title: String {
    switch self {
    case .customError(title: let title, message: _):
      return title
    default:
      return "Ошибка"
    }
  }
  
  var message: String? {
    switch self {
    case .mappingError:
      return "Формат данных изменился. Обновите версию приложения"
    case .customError(title: _, message: let message):
      return message
    }
  }
  
}
