//
//  Created by Dmitry Ivanenko on 17/11/2016.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import UIKit


class RepositoryDetailsViewController: UIViewController {

  var output: RepositoryDetailsViewOutput!
  
  @IBOutlet weak var contentLabel: UILabel!
  @IBOutlet weak var addButton: UIButton!


  // MARK: Life cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    output.viewIsReady()
  }

}


// MARK: - IBActions

extension RepositoryDetailsViewController {
  
  @IBAction func addButtonPressed() {
    output.appendToRepository()
  }
  
}


// MARK: - RepositoryDetailsViewInput

extension RepositoryDetailsViewController: RepositoryDetailsViewInput {
    
  func setupInitialState() {
    title = "Details"
    addButton.isEnabled = false
  }
  
  func show(content: String) {
    contentLabel.text = content
    addButton.isEnabled = true
  }

}
