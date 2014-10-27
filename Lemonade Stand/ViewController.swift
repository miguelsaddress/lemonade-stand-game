//
//  ViewController.swift
//  Lemonade Stand
//
//  Created by Miguel Angel Moreno Armenteros on 27/10/14.
//  Copyright (c) 2014 Miguel Angel Moreno Armenteros. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Inventory Elements
    @IBOutlet weak var dollarsLabel: UILabel!
    @IBOutlet weak var lemonsLabel: UILabel!
    @IBOutlet weak var iceCubesLabel: UILabel!
    
    //Purchase Elements
    @IBOutlet weak var purchaseLemonsLabel: UILabel!
    @IBOutlet weak var purchaseIceCubesLabel: UILabel!
    
    //Mix Elements
    @IBOutlet weak var mixLemonsLabel: UILabel!
    @IBOutlet weak var mixIceCubesLabel: UILabel!
    
    //constants
    let lemonCost = 2
    let iceCubecost = 1
    
    //variables (with observers to the labesl)
    var dollars:Int = 0 {
        didSet {
            self.dollarsLabel.text = "\(self.dollars)"
        }
    }

    var lemons:Int = 0 {
        didSet {
            self.lemonsLabel.text = "\(self.lemons)"
        }
    }
    
    var iceCubes:Int = 0 {
        didSet {
            self.iceCubesLabel.text = "\(self.iceCubes)"
        }
    }
    
    var purchaseLemons:Int = 0 {
        didSet {
            self.purchaseLemonsLabel.text = "\(self.purchaseLemons)"
        }
    }
    
    var purchaseIceCubes:Int = 0 {
        didSet {
            self.purchaseIceCubesLabel.text = "\(self.purchaseIceCubes)"
        }
    }

    var mixLemons:Int = 0 {
        didSet {
            self.mixLemonsLabel.text = "\(self.mixLemons)"
        }
    }
    
    var mixIceCubes:Int = 0 {
        didSet {
            self.mixIceCubesLabel.text = "\(self.mixIceCubes)"
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        //Setting the initial game quantities
        self.dollars = 10
        self.lemons = 1
        self.iceCubes = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Purchase buttons
    
    @IBAction func purchaseMoreLemonsPressed(sender: UIButton) {
        //can i purchase that lemon?
        if self.dollars >= self.lemonCost {
            self.purchaseLemons++
            self.dollars -= self.lemonCost
        }
 
    }
    
    @IBAction func purchaseLessLemonsPressed(sender: UIButton) {
        if self.purchaseLemons > 0 {
            self.purchaseLemons--
            self.dollars += self.lemonCost
        }
    }
    

    @IBAction func purchaseMoreIceCubesPressed(sender: UIButton) {
        //can i purchase that ice cube?
        if self.dollars >= self.iceCubecost {
            self.purchaseIceCubes++
            self.dollars -= self.iceCubecost
        }

    }
    
    @IBAction func purchaseLessIceCubesPressed(sender: UIButton) {
        if self.purchaseIceCubes > 0 {
            self.purchaseIceCubes--
            self.dollars += self.iceCubecost
        }
    }
    
    // Mix buttons
    @IBAction func mixMoreLemonsPressed(sender: UIButton) {
        self.mixLemons++
    }
    
    @IBAction func mixLessLemonsPressed(sender: UIButton) {
        if self.mixLemons > 0 {
            self.mixLemons--
        }
    }
    
    @IBAction func mixMoreIceCubesPressed(sender: UIButton) {
        self.mixIceCubes++
    }
    
    @IBAction func mixLessIceCubesPressed(sender: UIButton) {
        if self.mixIceCubes > 0 {
            self.mixIceCubes--
        }
    }
    
    //Start day action
    
    @IBAction func startDay(sender: UIButton) {
    }
    
    
}

