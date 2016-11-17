//
//  Created by Dmitry Ivanenko on 17.11.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import Foundation
import Alamofire


protocol TrandingNetworkServiceProtocol {
  func loadTop(forLang lang: Lang, completion: @escaping (Result<[Repository]>) -> Void)
}
