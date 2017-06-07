//
//  DistanceInfoViewController.swift
//  Pedometer Party
//
//  Created by LunarLincoln on 6/6/17.
//  Copyright © 2017 LunarLincoln. All rights reserved.
//

import UIKit

class DistanceInfoViewController: UIViewController {

    var strideLength = 0.0
    var averageStepsPerDay = 0
    var inchesPerDay = 0.0
    var stepArray: [Int] = []
    var height = 0
    
    @IBOutlet weak var moonDistanceLabel: UILabel!
    @IBOutlet weak var disneyDistanceLabel: UILabel!
    @IBOutlet weak var damDistanceLabel: UILabel!
    @IBOutlet weak var TSUDistanceLabel: UILabel!
    @IBOutlet weak var KentuckyDistanceLabel: UILabel!
    
    
    @IBAction func startOverButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "StartOverSegue", sender: self)
    }
    
    let MoonDistanceInches: Double = 15136700000
    let DisneyDistanceInches = 43661376
    let DamDistanceInches = 1032768
    let TSUDistanceInches = 177408
    let KentuckyDistanceInches = 2395008
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        inchesPerDay = Double(averageStepsPerDay) * strideLength
        
        var daysToTravel = round(10*(MoonDistanceInches/inchesPerDay)/10)
        let yearsToTravel = daysToTravel/365.0
        let years = Int(floor(yearsToTravel))
        let remainingMonths = (yearsToTravel*10).truncatingRemainder(dividingBy: 10)
        let month = Int((remainingMonths/10) * 12)
        moonDistanceLabel.text = "\(years)y \(month)m"
        
        daysToTravel = Double(Double(DisneyDistanceInches)/inchesPerDay)
        var days = Int(floor(daysToTravel))
        var remainingHours = (daysToTravel*10).truncatingRemainder(dividingBy: 10)
        var hours = Int((remainingHours/10) * 24)
        disneyDistanceLabel.text = "\(days)d \(hours)h"
        
        daysToTravel = Double(Double(DamDistanceInches)/inchesPerDay)
        days = Int(floor(daysToTravel))
        remainingHours = (daysToTravel*10).truncatingRemainder(dividingBy: 10)
        hours = Int((remainingHours/10) * 24)
        damDistanceLabel.text = "\(days)d \(hours)h"
        
        daysToTravel = Double(Double(TSUDistanceInches)/inchesPerDay)
        days = Int(floor(daysToTravel))
        remainingHours = (daysToTravel*10).truncatingRemainder(dividingBy: 10)
        hours = Int((remainingHours/10) * 24)
        TSUDistanceLabel.text = "\(days)d \(hours)h"
        
        daysToTravel = Double(Double(KentuckyDistanceInches)/inchesPerDay)
        days = Int(floor(daysToTravel))
        remainingHours = (daysToTravel*10).truncatingRemainder(dividingBy: 10)
        hours = Int((remainingHours/10) * 24)
        KentuckyDistanceLabel.text = "\(days)d \(hours)h"
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BackButtonSegue" {
            
            //destination is coming back nil
            let destination = segue.destination as? DataEntryViewController
            destination?.stepArray = stepArray
            destination?.heightInches = Double(height)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
