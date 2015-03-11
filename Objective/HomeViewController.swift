//
//  HomeViewController.swift
//  Objective
//
//  Created by Jessie Alvarez on 3/9/15.
//  Copyright (c) 2015 Jessie Alvarez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIDynamicAnimatorDelegate {
    
    private struct UserStorageConstants {
        static let Name = "Name"
        static let CurrencyName = "Currency Name"
        static let CurrencyCost = "Currency Cost"
        static let GoalName = "Goal Name"
        static let GoalCost = "Goal Cost"
        static let CurrentSaved = "Current Saved"
    }
    
    @IBOutlet var homeView: BezierPathsView!
    var currencyCost: Double?
    var currencyName: String?
    var goalNumObjects: Int? = 0
    var currentNumObjects: Int? = 0
    var objectImage: UIImage?
    var baseObjectSize: CGSize {
        let imageSize = objectImage!.size
        let aspectRatio = imageSize.height / imageSize.width
        let screenArea = homeView.bounds.width * homeView.bounds.height
        let imageArea = goalNumObjects == 0 ? screenArea / 50 : screenArea / CGFloat(goalNumObjects!)
        var width = sqrt(imageArea / aspectRatio)
        width = width > imageSize.width ? imageSize.width : width
        let height = width * aspectRatio
        return CGSize(width: width, height: height)
    }
    
    
    @IBOutlet weak var objectCountLabel: UILabel!
    
    
    lazy var animator: UIDynamicAnimator = {
        let lazilyCreatedDynamicAnimator = UIDynamicAnimator(referenceView: self.homeView)
        lazilyCreatedDynamicAnimator.delegate = self
        return lazilyCreatedDynamicAnimator
    }()
    
    let objectPlayBehavior = ObjectPlayBehavior()

    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        animator.addBehavior(objectPlayBehavior)
        objectPlayBehavior.addBarrier(UIBezierPath(rect: homeView.bounds), named: "Screen")
        objectPlayBehavior.collider.translatesReferenceBoundsIntoBoundary = true
        objectImage = UIImage(named: "coffee")
        if let user = defaults.objectForKey(UserStorageConstants.Name) as? Int {
            // load home page
            update()
            drawAllObjects()
        } else {
            performSegueWithIdentifier("Tutorial", sender: self)
        }
        // If the user has not used the app before (NSUserDefaults empty)
        // segue to the tutorial
        // Else, add in currencies
//        objectImage = UIImage(named: "coffee")
//        goalNumObjects = 0
//        currentNumObjects = 46
        
    }
    
    @IBAction func tutorialDone(segue:UIStoryboardSegue) {
        update()
        drawAllObjects()
    }
    
    func update() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let currencyCostValue = defaults.objectForKey(UserStorageConstants.CurrencyCost) as? Double {
            currencyCost = currencyCostValue
            if let goalCost = defaults.objectForKey(UserStorageConstants.GoalCost) as? Double {
                goalNumObjects = Int(ceil(goalCost / currencyCost!))
            }
            if let currencyNameValue = defaults.objectForKey(UserStorageConstants.CurrencyName) as? String {
                currencyName = currencyNameValue
            }
        }
        if let currentObjects = defaults.objectForKey(UserStorageConstants.CurrentSaved) as? Int {
            currentNumObjects = currentObjects
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        objectPlayBehavior.addBarrier(UIBezierPath(rect: homeView.bounds), named: "Screen")
        let motionManager = AppDelegate.Motion.Manager
        if motionManager.accelerometerAvailable {
            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()) { (data, error) -> Void in
                self.objectPlayBehavior.gravity.gravityDirection = CGVector(dx: data.acceleration.x, dy: -data.acceleration.y)
                self.objectPlayBehavior.gravity.magnitude = 0.5
            }
        }
        
        // Attributed string in case I want to customize it more later
        var text: NSMutableAttributedString
        if currentNumObjects != nil && goalNumObjects != nil {
            if goalNumObjects > 0 {
                text = NSMutableAttributedString(string: "\(currentNumObjects!) out of \(goalNumObjects!)")
            } else {
                text = NSMutableAttributedString(string: "\(currentNumObjects!) saved")
            }
        } else {
            text = NSMutableAttributedString(string: "")
        }
        objectCountLabel.attributedText = text
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        AppDelegate.Motion.Manager.stopAccelerometerUpdates()
    }
    
    func drawAllObjects() {
        var numObjects = currentNumObjects!
        var power = Int(pow(10, floor(log10(Double(numObjects)))))
        //println(power)
        while numObjects > 0 {
            let count = numObjects / power
            //println("count")
            //println(count)
            let multiple = Int(floor(log10(Double(numObjects)))) + 1
            let currentSize = CGSize(width: Int(baseObjectSize.width) * multiple, height: Int(baseObjectSize.height) * multiple)
            for i in 1...count {
                addObjectToScreen(currentSize)
            }
            numObjects = numObjects % power
            //println("numobjects")
            //println(numObjects)
            power = Int(pow(10, floor(log10(Double(numObjects)))))
            //println("power")
            //println(power)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addObjectToScreen(size: CGSize) {
        let objectView = UIImageView(frame: CGRect(origin: CGPoint(x: homeView.bounds.midX, y: 2), size: size))
        objectView.image = objectImage
        objectPlayBehavior.addObject(objectView)
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
