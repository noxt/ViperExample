//
//  Created by Dmitry Ivanenko on 17/11/2016.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import UIKit
import TableKit


class RepositoriesListViewController: UIViewController {

  var output: RepositoriesListViewOutput!
  
  @IBOutlet weak var tableView: UITableView! {
    didSet {
      tableDirector = TableDirector(tableView: tableView)
      tableView.tableFooterView = UIView()
    }
  }
  fileprivate var tableDirector: TableDirector!


  // MARK: Life cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    output.viewIsReady()
  }

}


// MARK: - RepositoriesListViewInput

extension RepositoriesListViewController: RepositoriesListViewInput {
    
  func setupInitialState() {
    title = "Swift Tranding"
  }
  
  func show(repositories: [Repository]) {
    let clickAction = TableRowAction<RepositoryListCell>(.click) {
      [weak self] data in
      
      self?.output.openDetails(forRepository: data.item)
    }
    
    tableDirector
      .clear()
      .append(rows: repositories.map({ TableRow<RepositoryListCell>(item: $0, actions: [clickAction]) }))
      .reload()
  }

}
