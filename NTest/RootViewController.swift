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
  
  // MARK: Properties
  fileprivate var firstButton: UIButton!
  fileprivate var firstLabel: UILabel!
  
  // MARK: Initialization
  fileprivate func initLabel() {
    firstLabel = UILabel(frame: .zero)
    self.view.addSubview(firstLabel)
    
    // Setting first label
    firstLabel.text = "Hello World"
    firstLabel.textAlignment = .center
  }
  
  fileprivate func initFirstButton() {
    firstButton = UIButton(type: .system)
    firstButton.frame = .zero
    self.view.addSubview(firstButton)
    
    // Setting first button
    firstButton.backgroundColor = .green
    firstButton.setTitle("button", for: UIControlState.normal)
    firstButton.setTitleShadowColor(.white, for: UIControlState.normal)
    firstButton.reversesTitleShadowWhenHighlighted = true
    firstButton.layer.cornerRadius = 100
    
    // Setting button shadow
    firstButton.layer.shadowColor = UIColor.white.cgColor
    firstButton.layer.shadowRadius = 20
    firstButton.layer.shadowOpacity = 0.8
    firstButton.layer.shadowOffset = CGSize(width: 0, height: 0)
    
    // Setting button tap event
    firstButton.addTarget(self, action: #selector(clickDown), for: UIControlEvents.touchDown)
    firstButton.addTarget(self, action: #selector(clickUp), for: UIControlEvents.touchUpInside)
  }
  
  // MARK: Life circle
  override func viewDidLoad() {
    super.viewDidLoad()

    // Init subview
    initLabel()
    initFirstButton()
  }
  
  // MARK: Constraints
  override func viewDidLayoutSubviews() {
    makeConstraints()
  }
  
  fileprivate func makeConstraints() {
    // First label constraint
    firstLabel.snp.makeConstraints { (make) in
      make.width.height.equalTo(100)
      make.center.equalTo(super.view.center)
      // make.top.left.width.height.equalTo(200)
    }
    
    firstButton.snp.makeConstraints { (make) in
      make.top.equalTo(firstLabel.snp.bottom).offset(32)
      make.left.equalTo(firstLabel.snp.left)
      make.width.height.equalTo(100)
    }
  }
  
  
  // MARK: Tap events
  @objc func clickDown() {
    //NSLog(String.type, "ok")
    //if (firstButton.currentTitle == "button") {
      firstButton.setTitle("hello", for: .normal)
//    }else if (firstButton.currentTitle == "hello") {
//      firstButton.setTitle("button", for: .normal)
 //   }
  }
  
  @objc func clickUp() {
    //NSLog(String.type, "ok")
      firstButton.setTitle("button", for: .normal)
  }
  // MARK: Methods
  
  
  
}
