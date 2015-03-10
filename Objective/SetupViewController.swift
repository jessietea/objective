//
//  SetupViewController.swift
//  Objective
//
//  Created by Jessie Alvarez on 3/10/15.
//  Copyright (c) 2015 Jessie Alvarez. All rights reserved.
//

import UIKit
import Foundation

class SetupViewController: TutorialContentViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var costField: UITextField!
    
    @IBOutlet weak var goalNameField: UITextField!
    
    @IBOutlet weak var goalCostField: UITextField!
    
    private struct UserStorageConstants {
        static let Name = "Name"
        static let CurrencyName = "Currency Name"
        static let CurrencyCost = "Currency Cost"
        static let GoalName = "Goal Name"
        static let GoalCost = "Goal Cost"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        }
        let cost = (costField.text as NSString).doubleValue // error checking?
        defaults.setObject(cost, forKey: UserStorageConstants.CurrencyCost)
        if let goalName = goalNameField.text {
            defaults.setObject(goalName, forKey: UserStorageConstants.GoalName)
        }
        let goalCost = (goalCostField.text as NSString).doubleValue // error checking?
        defaults.setObject(goalCost, forKey: UserStorageConstants.GoalCost)
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
