//
//  SettingsViewController.swift
//  tipCa
//
//  Created by Cao Thắng on 6/20/16.
//  Copyright © 2016 thangcao. All rights reserved.
//

import UIKit

class SettingsViewController: BaseViewController {
    
    @IBOutlet weak var buttonMinusExcellentService: UIButton!
    
    @IBOutlet weak var buttonIncreaseExcellentService: UIButton!
    
    @IBOutlet weak var buttonMinusSatisfactoryService: UIButton!
    
    @IBOutlet weak var buttonIncreaseSatisfactoryService: UIButton!
    
    @IBOutlet weak var buttonMinusTerribleService: UIButton!
    
    @IBOutlet weak var buttonIncreaseTerribleSerivce: UIButton!
    
    @IBOutlet weak var buttonSaveSetting: UIButton!
    
    @IBOutlet weak var buttonResetSetting: UIButton!
    
    // Label
    
    @IBOutlet weak var labelExcellentPercent: UILabel!
    
    @IBOutlet weak var labelSatisfactoryPercent: UILabel!
    
    @IBOutlet weak var labelTerriblePercent: UILabel!
    // Switch
    
    @IBOutlet weak var switchTheme: UISwitch!
    
    var valueTipExcellent = 0.0
    var valueTipSatisFactory = 0.0
    var valueTipTerrible = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpCircleViewOfButtons()
        updateView()
        updateRootViewBackGround(tipTheme)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear Setting")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear Setting")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear Setting")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear Setting")
    }
}

extension SettingsViewController {
    
    // Excellent :  20% -> 25%
    
    @IBAction func minusExcellentClick(sender: AnyObject) {
        
        if valueTipExcellent > 0.20{
            valueTipExcellent = valueTipExcellent - 0.01
            let newValue = HandleUtil.formartPercentage(valueTipExcellent)
            labelExcellentPercent.text = "\(newValue)%"
        }
        
    }
    
    @IBAction func increaseExcellentClick(sender: AnyObject) {
        if valueTipExcellent < 0.25{
            valueTipExcellent = valueTipExcellent + 0.01
            let newValue = HandleUtil.formartPercentage(valueTipExcellent)
            labelExcellentPercent.text = "\(newValue)%"
        }
    }
    
    // SatisFactory: 15% -> 19%
    
    @IBAction func minusSatisFactoryClick(sender: AnyObject) {
        if valueTipSatisFactory > 0.15{
            valueTipSatisFactory = valueTipSatisFactory - 0.01
            let newValue = HandleUtil.formartPercentage(valueTipSatisFactory)
            labelSatisfactoryPercent.text = "\(newValue)%"
        }
    }
    
    @IBAction func increaseSatisFactoryClick(sender: AnyObject) {
        if valueTipSatisFactory < 0.19{
            valueTipSatisFactory = valueTipSatisFactory + 0.01
            let newValue = HandleUtil.formartPercentage(valueTipSatisFactory)
            labelSatisfactoryPercent.text = "\(newValue)%"
        }
    }
    
    // Terrible: 10% -> 14%
    @IBAction func minusTerribleClick(sender: AnyObject) {
        if valueTipTerrible > 0.10{
            valueTipTerrible = valueTipTerrible - 0.01
            let newValue = HandleUtil.formartPercentage(valueTipTerrible)
            labelTerriblePercent.text = "\(newValue)%"
        }
    }
    
    
    @IBAction func increaseTerribleClick(sender: AnyObject) {
        if valueTipTerrible < 0.14{
            valueTipTerrible = valueTipTerrible + 0.01
            let newValue = HandleUtil.formartPercentage(valueTipTerrible)
            labelTerriblePercent.text = "\(newValue)%"
        }
    }
    
    @IBAction func saveSettingClick(sender: AnyObject) {
        defaults.setDouble(valueTipExcellent, forKey: Constants.KEY_TIP_EXCELLENT)
        defaults.setDouble(valueTipSatisFactory, forKey: Constants.KEY_TIP_SATISFACTORY)
        defaults.setDouble(valueTipTerrible, forKey: Constants.KEY_TIP_TERRIBLE)
        defaults.setBool(tipTheme, forKey: Constants.KET_TIP_THEME)
        setNewValueTipPercentage(valueTipTerrible, index: 0)
        setNewValueTipPercentage(valueTipSatisFactory, index: 1)
        setNewValueTipPercentage(valueTipExcellent, index: 2)
        defaults.synchronize()
        showAlert()
    }
    
    @IBAction func resetSettingClick(sender: AnyObject) {
        resetSettings()
        updateView()
        updateRootViewBackGround(false)
    }
    
    @IBAction func switchChanged(sender: AnyObject) {
        if switchTheme.on {
            tipTheme = true
        }
        else {
            tipTheme = false
        }
        updateRootViewBackGround(tipTheme)
    }
}

extension SettingsViewController {
    func setUpCircleViewOfButtons() {
        HandleUtil.makeCircleView(buttonMinusExcellentService)
        HandleUtil.makeCircleView(buttonIncreaseExcellentService)
        HandleUtil.makeCircleView(buttonMinusSatisfactoryService)
        HandleUtil.makeCircleView(buttonIncreaseSatisfactoryService)
        HandleUtil.makeCircleView(buttonMinusTerribleService)
        HandleUtil.makeCircleView(buttonIncreaseTerribleSerivce)
        HandleUtil.makeWhiteBorderButton(buttonSaveSetting)
        HandleUtil.makeWhiteBorderButton(buttonResetSetting)
    }
    func updateView(){
        restoreValueInNSDefault()
        valueTipTerrible = getTipPercentage(0)
        valueTipSatisFactory = getTipPercentage(1)
        valueTipExcellent = getTipPercentage(2)
        labelTerriblePercent.text = "\(HandleUtil.formartPercentage(valueTipTerrible))%"
        labelSatisfactoryPercent.text = "\(HandleUtil.formartPercentage(valueTipSatisFactory))%"
        labelExcellentPercent.text = "\(HandleUtil.formartPercentage(valueTipExcellent))%"
        switchTheme.setOn(tipTheme, animated: true)
    }
    func showAlert(){
        let alertController = UIAlertController(title: "Successfull", message:
            "Save Settings Successfully", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
   
}

