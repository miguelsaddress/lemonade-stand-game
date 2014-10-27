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
    
    //Weather image view
    @IBOutlet weak var weatherImageView: UIImageView!
    
    
    //constants
    let lemonCost = 2
    let iceCubeCost = 1
    let glassPrice = 1
    
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

    var lemonadeTaste = LemonadeTaste.Neutral
    var numberOfCustomers = 0
    var customerPreferences: [LemonadeTaste] = []
    var weather: Weather? = Weather.Mild {
        didSet {
            if self.weather == Weather.Cold {
                self.weatherImageView.image = UIImage(named: "Cold")
            } else if self.weather == Weather.Warm {
                self.weatherImageView.image = UIImage(named: "warm")
            } else {
                self.weatherImageView.image = UIImage(named: "Mild")
            }
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
    
    private func showAlertWithtext(header: String = "Warning", message: String, style:UIAlertControllerStyle = UIAlertControllerStyle.Alert) {
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
        
        // do the maths, win or lose
        //1. Create acidic ratio
        self.determineLemonadeTaste()
        //2. randomize weather and create random number of customers (1-10)
        self.determineNumberOfCustomers()
        self.determineWeather()
        self.adjustCustomersToWeather()
        //3. random taste preference per user (between 0 and 1)
        self.setRandomPreferences()
        //4. attend customers to earn money
        self.attendCustomers()
        
        //clear vars
        self.resetValues()
    }
    
    private func resetValues() {
        self.mixLemons = 0
        self.mixIceCubes = 0
        self.numberOfCustomers = 0
        self.customerPreferences.removeAll(keepCapacity: true)
    }
    
    private func adjustCustomersToWeather(){
        print("The weather is [\(self.weather!)]...")

        switch(self.weather!){
        case Weather.Warm:
            self.numberOfCustomers += 4
            println("+4 customers! [\(self.numberOfCustomers)] ")
        case Weather.Cold:
            self.numberOfCustomers -= 3
            println("-3 customers! [\(self.numberOfCustomers)] ")
        default:
            self.numberOfCustomers += 0
            println("[\(self.numberOfCustomers)] +0 customers!")
        }

    }
    
    private func determineWeather() {
        let random = Int( arc4random_uniform(UInt32(3)) )
        self.weather = Weather(rawValue: random)
    }
    
    private func determineNumberOfCustomers(){
        self.numberOfCustomers = Int(arc4random_uniform(UInt32(10))) + 1
        println("[\(self.numberOfCustomers)] possible customers")
    }
    
    private func determineLemonadeTaste(){
        let cubes = Double(self.mixIceCubes)
        let lemons = Double(self.mixLemons)
        var acidicRatio = lemons/cubes
        if acidicRatio > 1 {
            self.lemonadeTaste = LemonadeTaste.Acidic
        } else if acidicRatio == 1 {
            self.lemonadeTaste = LemonadeTaste.Neutral
        } else {
            self.lemonadeTaste = LemonadeTaste.Diluted
        }
        println("The lemonade's taste is [\(self.lemonadeTaste)]")
    }
    
    private func setRandomPreferences(){
        for var c=0; c < self.numberOfCustomers; c++ {
            var pref: Double
            pref = Double(arc4random_uniform(UInt32(10))) / 10.0
            
            // println( "pref [\(pref)]" )
            if pref >= 0 && pref < 0.4 {
                // println("c=[\(c)] - Acidic")
                self.customerPreferences.append(LemonadeTaste.Acidic)
            } else if pref >= 0.4 && pref < 0.6 {
                // println("c=[\(c)] - Neutral")
                self.customerPreferences.append(LemonadeTaste.Neutral)
            } else {
                // println("c=[\(c)] - Diluted")
                self.customerPreferences.append(LemonadeTaste.Diluted)
            }
        }
    }
    
    private func attendCustomers() {
        var earnings = 0
        for var i=0; i<self.customerPreferences.count; i++ {
            let custPref = self.customerPreferences[i]
            print("Customer [\(i)] likes it \(custPref.toRaw()), ")
            
            if custPref == self.lemonadeTaste {
                self.dollars += self.glassPrice
                earnings++
                println("Paid!")
            } else {
                println("No match, no revenue!")
            }
        }
        self.showAlertWithtext(header: "Congrats!!", message: "You just earned \(earnings)!")
        
    }
    
}

