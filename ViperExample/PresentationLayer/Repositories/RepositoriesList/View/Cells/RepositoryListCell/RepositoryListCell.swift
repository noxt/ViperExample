//
//  Created by Dmitry Ivanenko on 17.11.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import UIKit
import TableKit


class RepositoryListCell: UITableViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  
}


// MARK: - ConfigurableCell

extension RepositoryListCell: ConfigurableCell {
  
  func configure(with repository: Repository) {
    titleLabel.text = repository.name
  }
  
}
