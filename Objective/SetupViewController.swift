//
//  SetupViewController.swift
//  Objective
//
//  Created by Jessie Alvarez on 3/10/15.
//  Copyright (c) 2015 Jessie Alvarez. All rights reserved.
//

import UIKit
import Foundation

class SetupViewController: TutorialContentViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var objectPicker: UIPickerView!
    @IBOutlet weak var costField: UITextField!
    
    @IBOutlet weak var goalNameField: UITextField!
    
    @IBOutlet weak var goalCostField: UITextField!
    
    var selectedObject = ""
    
    private struct UserStorageConstants {
        static let Name = "Name"
        static let CurrencyName = "Currency Name"
        static let CurrencyCost = "Currency Cost"
        static let GoalName = "Goal Name"
        static let GoalCost = "Goal Cost"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        objectPicker.dataSource = self
        objectPicker.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        if let name = nameField.text {
            defaults.setObject(name, forKey: UserStorageConstants.Name)
            println(nameField.text)
        }
        let cost = (costField.text as NSString).doubleValue // error checking?
        defaults.setObject(cost, forKey: UserStorageConstants.CurrencyCost)
        if let goalName = goalNameField.text {
            defaults.setObject(goalName, forKey: UserStorageConstants.GoalName)
        }
        let goalCost = (goalCostField.text as NSString).doubleValue // error checking?
        defaults.setObject(goalCost, forKey: UserStorageConstants.GoalCost)
    }
    
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return AppDelegate.currencyInfo.currencies.count
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return AppDelegate.currencyInfo.currencies[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedObject = AppDelegate.currencyInfo.currencies[row]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
