//
//  ViewController.swift
//  ArrowRadiusViewDemo
//
//  Created by Ink on 2017/5/13.
//  Copyright © 2017年 Ink. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var topArrowRadiusView: ArrowRadiusView!
  @IBOutlet weak var bottomArrowRadiusView: ArrowRadiusView!
  @IBOutlet weak var leftArrowRadiusView: ArrowRadiusView!
  @IBOutlet weak var rightArrowRadiusView: ArrowRadiusView!

  override func viewDidLoad() {
    super.viewDidLoad()


    self.topArrowRadiusView.arrowDirection = .top
    self.topArrowRadiusView.arrowOffset = CGPoint.init(x: 10, y: 0)

    self.leftArrowRadiusView.arrowDirection = .left
    self.leftArrowRadiusView.arrowOffset = CGPoint.init(x: 0, y: 10)

    self.rightArrowRadiusView.arrowDirection = .right

    self.bottomArrowRadiusView.arrowDirection = .bottom
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

