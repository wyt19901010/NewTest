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
  
  fileprivate var firstTextField: UITextField!
  fileprivate var firstTextView: UITextView!
  //fileprivate var filedLabel: UILabel!
  
  
  fileprivate var leftSwitch: UISwitch!
  fileprivate var rightSwitch: UISwitch!
  //fileprivate var slideValue: UILabel!
  
  fileprivate var segmentedControl: UISegmentedControl!
  
  fileprivate var firstSlider: UISlider!
  
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
  
  fileprivate func initFirstTextField() {
    firstTextField = UITextField(frame: .zero)
    self.view.addSubview(firstTextField)
    
    firstTextField.borderStyle = UITextBorderStyle.bezel
    firstTextField.text = "WERVG"
    firstTextField.delegate = self as UITextFieldDelegate
  }
  
  fileprivate func initFirstTextView() {
   firstTextView = UITextView(frame: .zero)
    self.view.addSubview(firstTextView)
    
    firstTextView.text = "aaaaaaaaa"
    firstTextView.delegate = self as UITextViewDelegate
  }
  
  
  fileprivate func initLeftSwitch() {
    leftSwitch = UISwitch(frame: .zero)
    self.view.addSubview(leftSwitch)
    leftSwitch.isOn = true
    
   // leftSwitch.addTarget(self, action: #selector(switchDown), for: .valueChanged)
    
  }
  
  fileprivate func initRightSwitch() {
    rightSwitch = UISwitch(frame: .zero)
    self.view.addSubview(rightSwitch)
    rightSwitch.isOn = true
    
    rightSwitch.addTarget(self, action: #selector(switchDown), for: .valueChanged)
    
  }
  
  fileprivate func initSegmentedControl() {
    
    segmentedControl = UISegmentedControl(items: ["left","right"])
    self.view.addSubview(segmentedControl)

    segmentedControl.frame = .zero
    segmentedControl.addTarget(self, action: #selector(controlBottomHide), for: .valueChanged)
  }
  
  fileprivate func initFirstSlider() {
    firstSlider = UISlider(frame: .zero)
    self.view.addSubview(firstSlider)
    
    
    firstSlider.maximumValue = 100.0
    firstSlider.minimumValue = 0.0
    firstSlider.value = 50
    
    //firstLabel.text = String(firstSlider.value )
    
    firstSlider.addTarget(self, action: #selector(changeValueText), for: .valueChanged)
  }
  
  // MARK: Life circle
  override func viewDidLoad() {
    super.viewDidLoad()

    // Init subview
    initLabel()
    initFirstButton()
    initFirstTextField()
    initFirstTextView()
    initLeftSwitch()
    initRightSwitch()
    initSegmentedControl()
    initFirstSlider()
    // Close keyboard
    let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
    super.view.addGestureRecognizer(tap)
   
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)

  }
  
  // MARK: Constraints
  override func viewDidLayoutSubviews() {
    makeConstraints()
  }
  
  
  fileprivate func makeConstraints() {
    // First label constraint
    firstLabel.snp.makeConstraints { (make) in
      make.width.height.equalTo(100)
      make.top.left.equalToSuperview().offset(32)
      // make.top.left.width.height.equalTo(200)
    }
    
    firstButton.snp.makeConstraints { (make) in
      make.top.equalTo(firstLabel.snp.bottom).offset(32)
      make.left.equalTo(firstLabel.snp.left)
      make.width.height.equalTo(100)
    }
    
    firstTextView.snp.makeConstraints { (make) in
      make.top.equalTo(firstButton.snp.bottom).offset(32)
      make.left.equalTo(firstButton)
      make.width.height.equalTo(100)
    }
    
    firstTextField.snp.makeConstraints { (make) in
      make.top.equalTo(firstTextView.snp.bottom).offset(32)
      make.left.equalTo(firstButton)
      make.width.height.equalTo(firstTextField.intrinsicContentSize)
    }
    
    rightSwitch.snp.makeConstraints { (make) in
      make.top.equalToSuperview().offset(32)
      make.right.equalToSuperview().offset(-32)
      make.height.width.equalTo(50)
    }
    
    leftSwitch.snp.makeConstraints { (make) in
      make.top.equalToSuperview().offset(32)
      make.right.equalTo(rightSwitch.snp.left).offset(-32)
      make.height.width.equalTo(50)
    }
    
    segmentedControl.snp.makeConstraints { (make) in
      make.top.equalTo(leftSwitch.snp.bottom).offset(32)
      make.right.equalToSuperview().offset(-16)
      make.width.equalTo(200)
      make.height.equalTo(50)
    }
    
    firstSlider.snp.makeConstraints { (make) in
      make.bottom.right.equalToSuperview().offset(-32)
      make.width.equalTo(300)
      make.height.equalTo(50)
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

  @objc func tapped() {
    view.endEditing(true)
  }
  
  @objc func controlBottomHide() {
    print("begin to hide")
    if (rightSwitch.isHidden == false && leftSwitch.isHidden == false) {
      rightSwitch.isHidden = true
      leftSwitch.isHidden = true
    }else {
      rightSwitch.isHidden = false
      leftSwitch.isHidden = false
    }
  }
  
  @objc func switchDown() {
    print("asdfsaf")
    print(time)
    print(rightSwitch.isOn)
    if (rightSwitch.isOn == true) || ( leftSwitch.isOn == true) {
      rightSwitch.setOn(false, animated: true)
      leftSwitch.setOn(false, animated: true)
    }else  if (rightSwitch.isOn == false) || ( leftSwitch.isOn == false) {
      rightSwitch.setOn(true, animated: true)
      leftSwitch.setOn(true, animated: true)
    }
  }
  
  @objc func changeValueText() {
    firstLabel.text = String(Double(Int(firstSlider.value * 10))/10)
  }
}

extension RootViewController: UITextFieldDelegate,UITextViewDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    print("aaaaaaadrgfdgcgh")
   // textField.resignFirstResponder()
    view.endEditing(true)
    return true
  }
  
  func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    if ( text == "\n") || ( text == "a") {
      print("237894738952")
    //  textView.resignFirstResponder()
      view.endEditing(true)
      return false
    }
    return true
  }
  

  
  
}
