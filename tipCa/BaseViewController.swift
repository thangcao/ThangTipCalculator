//
//  BaseViewController.swift
//  tipCalculator
//
//  Created by Cao Thắng on 6/22/16.
//  Copyright © 2016 thangcao. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var tipPercentages = [0.10, 0.15, 0.20]
    var tipTheme = false
    let defaultPercentages = [0.10, 0.15, 0.20]
    let defaultTheme = false
    let defaults = NSUserDefaults.standardUserDefaults()
    var defaultColor: UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getTipPercentage(index: Int) -> Double {
        return tipPercentages[index]
    }
    func setNewValueTipPercentage(value: Double, index: Int){
        tipPercentages[index] = value
    }
    func restoreValueInNSDefault() {
        let valueTipTerrible = defaults.doubleForKey(Constants.KEY_TIP_TERRIBLE)
        let valueTipSatisFactory = defaults.doubleForKey(Constants.KEY_TIP_SATISFACTORY)
        let valueTipExcellent = defaults.doubleForKey(Constants.KEY_TIP_EXCELLENT)
        if valueTipExcellent != 0 && valueTipSatisFactory != 0 && valueTipTerrible != 0 {
            tipPercentages[0] = valueTipTerrible
            tipPercentages[1] = valueTipSatisFactory
            tipPercentages[2] = valueTipExcellent
            tipTheme = defaults.boolForKey(Constants.KET_TIP_THEME)
        }
        
    }
    func resetSettings() {
        tipPercentages = defaultPercentages
        tipTheme = defaultTheme
        defaults.setDouble(defaultPercentages[2], forKey: Constants.KEY_TIP_EXCELLENT)
        defaults.setDouble(defaultPercentages[1], forKey: Constants.KEY_TIP_SATISFACTORY)
        defaults.setDouble(defaultPercentages[0], forKey: Constants.KEY_TIP_TERRIBLE)
        defaults.setBool(defaultTheme, forKey: Constants.KET_TIP_THEME)
    }
    func updateRootViewBackGround(isBlackTheme: Bool){
        if isBlackTheme {
            view.backgroundColor = UIColor.blackColor()
        } else {
            view.backgroundColor = UIColor(red: 0.4, green: 0.8, blue: 1.0, alpha: 1.0)
        }
        
    }
}
