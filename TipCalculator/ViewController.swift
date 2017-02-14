//
//  ViewController.swift
//  TipCalculator
//
//  Created by Ekko Lin on 11/25/16.
//  Copyright © 2016 Fire_Fighters. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var payment: UITextField!
    @IBOutlet weak var tip_updater: UILabel!
    @IBOutlet weak var people_updater: UILabel!
    @IBOutlet weak var tip_result: UILabel!

    
    // Result bar
    @IBOutlet weak var tip_label: UILabel!
    @IBOutlet weak var foreach_label: UILabel!
    @IBOutlet weak var total_label: UILabel!
    
    @IBOutlet weak var people_seg: UISegmentedControl!
    @IBOutlet weak var tip_slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Tipper"
        
        payment.delegate = self
        payment.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapper(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calc_tip(sender: AnyObject) {
        
        let people_num = [1, 2, 3, 4]
        let currTip = Int(tip_slider.value * 100)
        tip_result.text = "\(currTip) % Tip"
        
        let bill = Double(payment.text!) ?? 0;
        let tip = bill * Double(tip_slider.value)
        let total = bill + tip
        let each = total / Double(people_num[people_seg.selectedSegmentIndex])
        
        tip_label.text = String(format: "$%.2f", tip)
        total_label.text = String(format: "$%.2f", total)
        foreach_label.text = String(format: "$%.2f", each)
    }

}

