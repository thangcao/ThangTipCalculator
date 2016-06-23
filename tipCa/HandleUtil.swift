//
//  HandleUtil.swift
//  tipCalculator
//
//  Created by Cao Thắng on 6/22/16.
//  Copyright © 2016 thangcao. All rights reserved.
//

import UIKit
struct HandleUtil {
    static func formatMoney (number: Double)  -> String{
        return String(format: "$%.2f", number)
    }
    static func makeCircleView (button: UIButton) {
        button.layer.cornerRadius =
            button.frame.size.width / 2
        button.clipsToBounds = true
        button.layer.borderColor = UIColor.whiteColor()
            .CGColor
        button.layer.borderWidth = 1
    }
    static func makeWhiteBorderButton (button: UIButton) {
        button.layer.borderColor = UIColor.whiteColor()
            .CGColor
        button.layer.borderWidth = 1
    }
    static func formartPercentage(value: Double) -> Int {
        return Int(value * 100)
    }
}