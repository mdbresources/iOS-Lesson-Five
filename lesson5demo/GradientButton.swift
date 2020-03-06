//
//  GradientButton.swift
//  lesson5demo
//
//  Created by Anmol Parande on 3/5/20.
//  Copyright © 2020 Anmol Parande. All rights reserved.
//

import UIKit

@IBDesignable
class GradientButton: UIButton {
    
    private var gradientLayer: CAGradientLayer?
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.gradientLayer?.cornerRadius = self.cornerRadius
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    
    @IBInspectable var gradientStartColor: UIColor = UIColor.green {
        didSet {
            self.gradientLayer?.colors = [gradientStartColor.cgColor, gradientEndColor.cgColor]
        }

    }
    
    @IBInspectable var gradientEndColor: UIColor = UIColor.white {
        didSet {
            self.gradientLayer?.colors = [gradientStartColor.cgColor, gradientEndColor.cgColor]
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        self.gradientLayer?.frame = self.bounds
        self.gradientLayer?.setNeedsDisplay()
    }
    
    func commonInit() {
        self.layer.cornerRadius = cornerRadius


        self.gradientLayer = CAGradientLayer()
        gradientLayer!.colors = [gradientStartColor.cgColor, gradientEndColor.cgColor]

        self.layer.addSublayer(self.gradientLayer!)
    }
}
