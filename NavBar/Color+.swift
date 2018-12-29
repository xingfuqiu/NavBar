//
//  Color+.swift
//  NavBar
//
//  Created by XingfuQiu on 2018/12/29.
//  Copyright © 2018 XingfuQiu. All rights reserved.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
