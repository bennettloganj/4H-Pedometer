//
//  ViewController.swift
//  Pedometer Party
//
//  Created by LunarLincoln on 6/6/17.
//  Copyright © 2017 LunarLincoln. All rights reserved.
//

import UIKit

class DataEntryViewController: UIViewController {

    
    var stepArray: [Int] = []
    var heightInches = 0.0
    
    @IBOutlet weak var dayOneSteps: UITextField!
    @IBOutlet weak var dayTwoSteps: UITextField!
    @IBOutlet weak var dayThreeSteps: UITextField!
    @IBOutlet weak var dayFourSteps: UITextField!
    @IBOutlet weak var dayFiveSteps: UITextField!
    @IBOutlet weak var height: UITextField!
    
    
    @IBAction func calculateButton(_ sender: UIButton) {
        var count = 0
        if let text = dayOneSteps.text, !text.isEmpty
        {
            stepArray.append(Int(text)!)
            count+=1
        }
        if let text = dayTwoSteps.text, !text.isEmpty
        {
            stepArray.append(Int(text)!)
            count+=1
        }
        if let text = dayThreeSteps.text, !text.isEmpty
        {
            stepArray.append(Int(text)!)
            count+=1
        }
        if let text = dayFourSteps.text, !text.isEmpty
        {
            stepArray.append(Int(text)!)
            count+=1
        }
        if let text = dayFiveSteps.text, !text.isEmpty
        {
            stepArray.append(Int(text)!)
            count+=1
        }
        if let text = height.text, !text.isEmpty
        {
            heightInches = Double(text)!
        }
        
        self.performSegue(withIdentifier: "SegueToDistanceInfo", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DataEntryViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        
        if !stepArray.isEmpty {
            dayOneSteps.text = String(stepArray[0])
            dayTwoSteps.text = String(stepArray[1])
            dayThreeSteps.text = String(stepArray[2])
            dayFourSteps.text = String(stepArray[3])
            dayFiveSteps.text = String(stepArray[4])
            height.text = String(heightInches)
        }
        
        view.addGestureRecognizer(tap)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var sum = 0
        for steps in stepArray {
            sum += steps
        }
        
        let average = sum / 5
        let strideLength = heightInches * 0.414
        if segue.identifier == "SegueToDistanceInfo" {
            
            
            //destination is coming back nil
            let navController = segue.destination as? UINavigationController
            let destination = navController?.topViewController as? DistanceInfoViewController
            destination?.strideLength = strideLength
            destination?.averageStepsPerDay = average
            destination?.stepArray = stepArray
            destination?.height = Int(heightInches)
            
        }
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

