//
//  HomeViewController.swift
//  Objective
//
//  Created by Jessie Alvarez on 3/9/15.
//  Copyright (c) 2015 Jessie Alvarez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        println("yo")
        let defaults = NSUserDefaults.standardUserDefaults()
        if let user = defaults.objectForKey("User Name") as? String {
            // load home page
        } else {
            performSegueWithIdentifier("Tutorial", sender: self)
        }
        // If the user has not used the app before (NSUserDefaults empty)
        // segue to the tutorial
        // Else, add in currencies
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
