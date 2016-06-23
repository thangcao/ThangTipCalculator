//
//  TipViewController.swift
//  tipCalculator
//
//  Created by Cao Thắng on 6/22/16.
//  Copyright © 2016 thangcao. All rights reserved.
//

import UIKit

class TipViewController: BaseViewController {
    
    // View Face
    @IBOutlet weak var faceTerrible: UIButton!
    
    
    @IBOutlet weak var faceSatisfactory: UIButton!
    
    
    @IBOutlet weak var faceExcellent: UIButton!
    
    @IBOutlet weak var labelTerribleService: UILabel!
    
    @IBOutlet weak var labelSatisfactoryService: UILabel!
    
    @IBOutlet weak var labelExcellentService: UILabel!
    
    // View Bill Amount
    @IBOutlet weak var textBillAmount: UITextField!
    
    // View Calculator
    @IBOutlet weak var labelTipPercentage: UILabel!
    
    @IBOutlet weak var labelTipAmount: UILabel!
    
    @IBOutlet weak var labelNumberPeople: UILabel!
    
    @IBOutlet weak var labelMoneyEeachPerson: UILabel!
    
    @IBOutlet weak var labelTotalMoney: UILabel!
    
    
    let moneyForEachPerson = 1
    var numberOfPerson = 1
    let moneyForTipAmount = 0
    var tipService = 0
    var billAmount = 0.00
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad Tip")
        // Do any additional setup after loading the view, typically from a nib.
        labelTipAmount.text = "$0.00"
        labelTotalMoney.text = "$0.00"
        labelNumberPeople.text = "\(numberOfPerson)"
        billAmount = defaults.doubleForKey(Constants.KEY_BILL_AMOUNT)
        if billAmount > 0 {
           textBillAmount.text = "\(billAmount)"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
         print("didReceiveMemoryWarning Tip")
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear Tip")
        restoreValueInNSDefault()
        let tipPercentage = Int(getTipPercentage(tipService) * 100)
        labelTipPercentage.text = "\(tipPercentage)%"
        onChanged()
        updateRootViewBackGround(tipTheme)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear Tip")
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear Tip")
        defaults.setDouble(billAmount, forKey: Constants.KEY_BILL_AMOUNT)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear Tip")
    }
    
    @IBAction func onChanged(sender: AnyObject) {
       onChanged()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func buttonTerribleClick(sender: AnyObject) {
        tipService = 0;
        updateAllButtonsService()
         let imageTerrbileGray = UIImage(named: "sad_face_white.png") as UIImage!
        changeButtonView(tipService, labelTipPercentage: labelTipPercentage, labelService: labelTerribleService, imageServiceWhite: imageTerrbileGray, faceService: faceTerrible)
    }
    
    @IBAction func buttonSatisfactoryClick(sender: AnyObject) {
        tipService = 1;
        updateAllButtonsService()
        let imageTerrbileGray = UIImage(named: "happy_face_white.png") as UIImage!
        changeButtonView(tipService, labelTipPercentage: labelTipPercentage, labelService: labelSatisfactoryService, imageServiceWhite: imageTerrbileGray, faceService: faceSatisfactory)
    }
    
    @IBAction func buttonExcellentClick(sender: AnyObject) {
        tipService = 2;
        updateAllButtonsService()
        let imageTerrbileGray = UIImage(named: "happy_face_white.png") as UIImage!
        changeButtonView(tipService, labelTipPercentage: labelTipPercentage, labelService: labelExcellentService, imageServiceWhite: imageTerrbileGray, faceService: faceExcellent)
    }
    
    
   
    @IBAction func buttonUpClick(sender: AnyObject) {
        numberOfPerson = numberOfPerson + 1
        labelNumberPeople.text = "\(numberOfPerson)"
    }
   
    
    @IBAction func buttonDownClick(sender: AnyObject) {
        if numberOfPerson > 1 {
            numberOfPerson = numberOfPerson - 1
            labelNumberPeople.text = "\(numberOfPerson)"
        }
    }
    
}

extension TipViewController {
    
    /*
     * This function use to change labelTipPercentage and layout button
     */
    func changeButtonView(tipService: Int, labelTipPercentage: UILabel, labelService: UILabel, imageServiceWhite : UIImage, faceService: UIButton) {
        let tipPercentage = Int(getTipPercentage(tipService) * 100)
        labelTipPercentage.text = "\(tipPercentage)%"
        labelService.textColor = UIColor.whiteColor()
        faceService.setBackgroundImage(imageServiceWhite, forState: UIControlState.Normal)
    }
    
    func updateAllButtonsService() {
        // Terrible Service
        let imageTerrbileGray = UIImage(named: "sad_face_gray.png") as UIImage!
        faceTerrible.setBackgroundImage(imageTerrbileGray, forState: UIControlState.Normal)
        labelTerribleService.textColor = UIColor.grayColor()
        // Satisfactory Service
        let imageSatisfactoryGray = UIImage(named: "happy_face_gray.png") as UIImage!
        faceSatisfactory.setBackgroundImage(imageSatisfactoryGray, forState: UIControlState.Normal)
        labelSatisfactoryService.textColor = UIColor.grayColor()
        // Excellent Service
        let imageExecllentGray = UIImage(named: "happy_face_gray.png") as UIImage!
        faceExcellent.setBackgroundImage(imageExecllentGray, forState: UIControlState.Normal)
        labelExcellentService.textColor = UIColor.grayColor()
    }
    
    func onChanged() {
        let tipPercenttage = getTipPercentage(tipService)
        billAmount = NSString(string: textBillAmount.text!).doubleValue
        let tip = billAmount * tipPercenttage
        let total = (billAmount + tip)
        let moneyEeachPerson = total / Double(numberOfPerson)
        labelTipAmount.text = HandleUtil.formatMoney(tip)
        labelMoneyEeachPerson.text = HandleUtil.formatMoney(moneyEeachPerson)
        labelTotalMoney.text = HandleUtil.formatMoney(total)
    }
}
