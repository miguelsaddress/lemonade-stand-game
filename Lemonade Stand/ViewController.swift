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


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Purchase buttons
    
    @IBAction func purchaseMoreLemonsPressed(sender: UIButton) {
    }
    
    @IBAction func purchaseLessLemonsPressed(sender: UIButton) {
    }
    

    @IBAction func purchaseMoreIceCubesPressed(sender: UIButton) {
    }
    
    @IBAction func purchaseLessIceCubesPressed(sender: UIButton) {
    }
    
    // Mix buttons
    @IBAction func addMoreLemonsPressed(sender: UIButton) {
    }
    
    @IBAction func addLessLemonsPressed(sender: UIButton) {
    }
    
    @IBAction func addMoreIceCubesPressed(sender: UIButton) {
    }
    
    @IBAction func addLessIceCubesPressed(sender: UIButton) {
    }
    
    //Start day action
    
    @IBAction func startDay(sender: UIButton) {
    }
    
    
}

