//
//  RootViewController.swift
//  NTest
//
//  Created by YUTONG WU on 2018/04/24.
//  Copyright © 2018 Big. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class RootViewController: UIViewController {
  fileprivate var firstLabel: UILabel!
  
  fileprivate func initLabel() {
    firstLabel = UILabel(frame: .zero)
    self.view.addSubview(firstLabel)

    firstLabel.text = "Hello World"
    firstLabel.textAlignment = .center
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    initLabel()

  }
  
  override func viewDidLayoutSubviews() {
    makeConstraints()

  }
  
    fileprivate func makeConstraints() {
      firstLabel.snp.makeConstraints { (make) in
        make.width.height.equalTo(firstLabel.intrinsicContentSize)
        make.center.equalTo(super.view.center)
       // make.top.left.width.height.equalTo(200)
      }
  }
}
