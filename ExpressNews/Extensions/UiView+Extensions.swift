//
//  UiView+Extensions.swift
//  ExpressNews
//
//  Created by VD on 19/10/2021.
//

import Foundation

import UIKit

extension UIView{
    //computed property to set corner radius on main.storyboard
    @IBInspectable var cornerradius :CGFloat{
        get {return cornerradius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
