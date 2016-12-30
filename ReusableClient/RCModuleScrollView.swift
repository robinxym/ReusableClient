//
//  RCModuleScrollView.swift
//  ReusableClient
//
//  Created by Xue Yong Ming on 30/12/2016.
//  Copyright © 2016 Robin. All rights reserved.
//

import UIKit

//class RCModuleScrollView: UIScrollView {
class RCModuleScrollView: UIScrollView, UIScrollViewDelegate {

  /*
   // Only override draw() if you perform custom drawing.
   // An empty implementation adversely affects performance during animation.
   override func draw(_ rect: CGRect) {
   // Drawing code
   }
   */

  private var moduleButtonTitles: [String] = []
  //    {
  //    didSet {
  //      setModules(moduleButtonTitles: moduleButtonTitles)
  //
  ////      contentSize = CGSize(width: paddingWidth + (moduleButtonWidth + paddingWidth) * CGFloat(moduleButtons.count), height: frame.height)
  ////      let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
  ////      label.text = "test"
  ////      addSubview(label)
  ////      layoutIfNeeded()
  //    }
  //  }

  var selectedTextColor: UIColor = .red
  var unSelectedTextColor: UIColor = .black
  private var selectedButtonIndex: Int = 0 {
    didSet {
      moduleButtons[oldValue].setTitleColor(unSelectedTextColor, for: .normal)
      moduleButtons[selectedButtonIndex].setTitleColor(selectedTextColor, for: .normal)

    }
  }
  var moduleButtonDidClickClosure:  ((Int) -> ())?
  private var moduleButtons: [UIButton] = []
  private var moduleButtonWidth: CGFloat = 0.0
  private let paddingWidth: CGFloat = 3.0
  private let paddingHeight: CGFloat = 3.0

  //  required init?(coder aDecoder: NSCoder) {
  //    delegate = self
  //  }
  //  override init(frame: CGRect) {
  //    super.init(frame: frame)
  ////    if(self != nil) {self.delegate = self}
  //    self.delegate = self
  //  }
  //
  //  required init?(coder aDecoder: NSCoder) {
  ////    fatalError("init(coder:) has not been implemented")
  //    super.init(coder: aDecoder)
  //    self.delegate = self
  //  }

  func setModules(moduleButtonTitles: [String]) {
    guard moduleButtonTitles.count > 0 else {return}

    //    isPagingEnabled = true

    super.delegate = self
//    isUserInteractionEnabled = true
    //    self.delegate = self
    subviews.forEach { $0.removeFromSuperview() }
    moduleButtons = []

    moduleButtons = moduleButtonTitles.map{
      let button = UIButton()
      button.backgroundColor = UIColor.white
      button.setTitle($0, for: .normal)
      button.setTitleColor(.black, for: .normal)
      button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
      button.titleLabel!.sizeToFit()
      if button.titleLabel!.frame.width > moduleButtonWidth {
        print(button.titleLabel!.frame.width)
        moduleButtonWidth = button.titleLabel!.frame.width
      }
      return button
    }

    for (index, button) in moduleButtons.enumerated() {
      let startX = paddingWidth + (moduleButtonWidth + paddingWidth) * CGFloat(index)
      button.frame = CGRect(x: startX, y: paddingHeight, width: moduleButtonWidth, height: frame.height - 2*paddingHeight)
      button.tag = index
      button.addTarget(self, action: #selector(buttonDidClick(button:)), for: UIControlEvents.touchUpInside)
      print(button.frame)
      addSubview(button)

    }
    contentSize = CGSize(width: paddingWidth + (moduleButtonWidth + paddingWidth) * CGFloat(moduleButtons.count), height: frame.height)
    contentInset = .zero
    selectedButtonIndex = 0
  }

  @objc private func buttonDidClick(button: UIButton) {
    selectedButtonIndex = button.tag
    if moduleButtonDidClickClosure != nil {
      moduleButtonDidClickClosure!(button.tag)
    }
  }

  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    print("scrollViewDidEndDragging")
    scrollToModuleButton()
  }

  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    print("scrollViewDidEndDecelerating")
//    let index = Int((contentOffset.x - paddingWidth) / (moduleButtonWidth + paddingWidth))
//    var startX = paddingWidth + (moduleButtonWidth + paddingWidth) * CGFloat(index)
//    startX = min(max(paddingWidth, startX), paddingWidth + (moduleButtonWidth + paddingWidth) * CGFloat(moduleButtons.count) - bounds.width)
//    let startY = paddingHeight
//
//    scrollRectToVisible(CGRect(x: startX, y: startY, width: bounds.width, height: bounds.height), animated: true)
    scrollToModuleButton()
  }

  private func scrollToModuleButton() {
    let index = Int((contentOffset.x - paddingWidth) / (moduleButtonWidth + paddingWidth))
    var startX = paddingWidth + (moduleButtonWidth + paddingWidth) * CGFloat(index)
    startX = min(max(paddingWidth, startX), paddingWidth + (moduleButtonWidth + paddingWidth) * CGFloat(moduleButtons.count) - bounds.width)
    let startY = paddingHeight

    scrollRectToVisible(CGRect(x: startX, y: startY, width: bounds.width, height: bounds.height), animated: true)
  }

  //  override init(frame: CGRect) {
  //    super.init(frame: frame)
  //  }
  //
  //  required init?(coder aDecoder: NSCoder) {
  //    fatalError("init(coder:) has not been implemented")
  //  }
  
}
