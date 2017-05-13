//
//  ArrowRadiusView.swift
//  Crucio
//
//  Created by Ink on 2017/4/10.
//  Copyright © 2017年 Sky Platanus. All rights reserved.
//

import UIKit

enum TipsArrowDirection {
  case top, left, right, bottom
}

class ArrowRadiusView: UIView {

  var arrowDirection: TipsArrowDirection = .top {
    didSet {
      self.setNeedsDisplay()
    }
  }
  @IBInspectable var arrowSize: CGSize = .zero {
    didSet {
      self.setNeedsDisplay()
    }
  }
  @IBInspectable var cornerRadius: CGFloat = 0 {
    didSet {
      self.setNeedsDisplay()
    }
  }

  @IBInspectable var boderWidth: CGFloat = 0 {
    didSet {
      self.setNeedsDisplay()
    }
  }

  @IBInspectable var borderColor: UIColor = .clear {
    didSet {
      self.setNeedsDisplay()
    }
  }

  /*
   *  x>0 arrow is right shift;
   *  y>0 arrow is shift bottom;
   *  default arrow in the center;
   */
  var arrowOffset: CGPoint = .zero {
    didSet {
      self.setNeedsDisplay()
    }
  }
  @IBInspectable var backGroundgColor: UIColor = .clear {
    didSet {
      self.setNeedsDisplay()
    }
  }

  @IBInspectable var redius: CGFloat = 0 {
    didSet {
      self.setNeedsDisplay()
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setup()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.setup()
  }

  override func draw(_ rect: CGRect) {
    super.draw(rect)

    var arrowX : CGFloat = 0
    var arrowY : CGFloat = 0
    var tipBgViewFrame : CGRect = CGRect.zero

    var arrowCorrectHeight:CGFloat = 0.0
    if arrowSize.height > 0 {
      arrowCorrectHeight = arrowSize.height
    }

    let arrowPath = UIBezierPath()

    switch self.arrowDirection {
    case .bottom:
      arrowX = self.bounds.width/2 + arrowOffset.x
      arrowY = self.bounds.height - self.boderWidth
      arrowPath.move(to: CGPoint(x: arrowX, y: arrowY))
      arrowPath.addLine(to: CGPoint(x: arrowX - arrowSize.width/2, y: arrowY - arrowSize.height))
      arrowPath.addLine(to: CGPoint(x: arrowX - arrowSize.width/2, y: arrowY - arrowCorrectHeight))
      arrowPath.addLine(to: CGPoint(x: arrowX + arrowSize.width/2, y: arrowY - arrowCorrectHeight))
      arrowPath.addLine(to: CGPoint(x: arrowX + arrowSize.width/2, y: arrowY - arrowSize.height))
      tipBgViewFrame = CGRect.init(x: boderWidth, y: boderWidth, width: self.bounds.width - 2 * boderWidth, height: self.bounds.height - arrowSize.height - 2 * boderWidth)
    case .left:
      arrowX = self.boderWidth
      arrowY = self.bounds.height/2 + arrowOffset.y
      arrowPath.move(to: CGPoint(x: arrowX, y: arrowY));
      arrowPath.addLine(to: CGPoint(x: arrowX + arrowSize.height, y: arrowY - arrowSize.width/2))
      arrowPath.addLine(to: CGPoint(x: arrowX + arrowCorrectHeight, y: arrowY - arrowSize.width/2))
      arrowPath.addLine(to: CGPoint(x: arrowX + arrowCorrectHeight, y: arrowY + arrowSize.width/2))
      arrowPath.addLine(to: CGPoint(x: arrowX + arrowSize.height, y: arrowY + arrowSize.width/2))
      tipBgViewFrame = CGRect.init(x: arrowSize.height + boderWidth, y: boderWidth, width: self.bounds.width - arrowSize.height - 2 * boderWidth, height: self.bounds.height - 2 * boderWidth)
    case .right:
      arrowX = self.bounds.width - self.boderWidth
      arrowY = self.bounds.height/2 + arrowOffset.y
      arrowPath.move(to: CGPoint(x: arrowX, y: arrowY));
      arrowPath.addLine(to: CGPoint(x: arrowX - arrowSize.height, y: arrowY - arrowSize.width/2))
      arrowPath.addLine(to: CGPoint(x: arrowX - arrowCorrectHeight, y: arrowY - arrowSize.width/2))
      arrowPath.addLine(to: CGPoint(x: arrowX - arrowCorrectHeight, y: arrowY + arrowSize.width/2))
      arrowPath.addLine(to: CGPoint(x: arrowX - arrowSize.height, y: arrowY + arrowSize.width/2))
      tipBgViewFrame = CGRect.init(x: boderWidth, y: boderWidth, width: self.bounds.width - arrowSize.height - 2 * boderWidth, height: self.bounds.height - 2 * boderWidth)
    default: //.Top
      arrowX = self.bounds.width/2 + arrowOffset.x
      arrowY = self.boderWidth
      arrowPath.move(to: CGPoint(x: arrowX, y: arrowY))
      arrowPath.addLine(to: CGPoint(x: arrowX + arrowSize.width/2, y: arrowY + arrowSize.height))
      arrowPath.addLine(to: CGPoint(x: arrowX + arrowSize.width/2, y: arrowY + arrowCorrectHeight))
      arrowPath.addLine(to: CGPoint(x: arrowX - arrowSize.width/2, y: arrowY + arrowCorrectHeight))
      arrowPath.addLine(to: CGPoint(x: arrowX - arrowSize.width/2, y: arrowY + arrowSize.height))
      tipBgViewFrame = CGRect.init(x: boderWidth, y: arrowSize.height + boderWidth, width: self.bounds.width - 2 * boderWidth, height: self.bounds.height - arrowSize.height - 2 * boderWidth)
      break
    }

    let path = UIBezierPath.init(roundedRect: tipBgViewFrame, cornerRadius: cornerRadius)
    path.append(arrowPath)

    path.lineWidth = boderWidth
    self.borderColor.setStroke()
    path.stroke()

    self.backGroundgColor.setFill()
    path.fill()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    self.setNeedsDisplay()
  }

  // MARK: Setup
  private func setup() {
    self.backgroundColor = .clear
  }

}
