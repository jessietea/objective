//
//  ConvertViewController.swift
//  Objective
//
//  Created by Jessie Alvarez on 3/11/15.
//  Copyright (c) 2015 Jessie Alvarez. All rights reserved.
//

import UIKit

class ConvertViewController: UIViewController, UITextFieldDelegate {
    
    var currencyImage: UIImage?
    var currencyCost: Double = 1

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var currencyCountLabel: UILabel!
    @IBOutlet weak var costField: UITextField!
    
    @IBAction func buyIt(sender: UIBarButtonItem) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveIt(sender: UIBarButtonItem) {
        println("about to try")
        // in navigation view controller
        (presentingViewController as? HomeViewController)?.makeDeposit((costField.text as NSString).doubleValue)
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        costField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if currencyCost != 0 {
            currencyCountLabel.text = "\((costField.text as NSString).doubleValue / currencyCost)"
        }
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        imageView.image = currencyImage
        imageView.frame.size = CGSize(width: 40, height: 40 * (currencyImage!.size.height / currencyImage!.size.width))
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
