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
    let iceCubeCost = 1
    
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
        self.purchaseLemons++
    }
    
    @IBAction func purchaseLessLemonsPressed(sender: UIButton) {
        if self.purchaseLemons > 0 {
            self.purchaseLemons--
        }
    }

    @IBAction func purchaseMoreIceCubesPressed(sender: UIButton) {
        self.purchaseIceCubes++
    }
    
    @IBAction func purchaseLessIceCubesPressed(sender: UIButton) {
        if self.purchaseIceCubes > 0 {
            self.purchaseIceCubes--
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
    
    //Purchase action
    @IBAction func purchaseItems(sender: UIButton) {
        //calculate total of what I wanna buy
        var totalCost = self.purchaseLemons * self.lemonCost + self.purchaseIceCubes * self.iceCubeCost
        if totalCost > self.dollars {
            self.showAlertWithtext(message: "Not enough credits for all that, folk")
        } else {
            self.lemons += self.purchaseLemons
            self.iceCubes += self.purchaseIceCubes
            self.dollars -= totalCost
            self.purchaseIceCubes = 0
            self.purchaseLemons = 0
        }
    }
    
    func showAlertWithtext(header: String = "Warning", message: String, style:UIAlertControllerStyle = UIAlertControllerStyle.Alert) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: style)
        var action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion:nil)
    }

    
    //Start day action
    @IBAction func startDay(sender: UIButton) {
        if self.mixIceCubes > self.iceCubes {
            self.showAlertWithtext(message: "Not enough ice cubes in stock")
            return
        }
        
        if self.mixLemons > self.lemons {
            self.showAlertWithtext(message: "Not enough lemons in stock")
            return
        }
        
        //use products, AKA, substract them from stock
        self.iceCubes -= self.mixIceCubes
        self.lemons -= self.mixLemons
        self.mixLemons = 0
        self.mixIceCubes = 0
        
        //do the maths, win or lose
    }
    
    
}

