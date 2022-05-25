//
//  ViewController.swift
//  PaymentApp
//
//  Created by Nhat on 25/05/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var person: UILabel!
    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var btn10: UIButton!
    @IBOutlet weak var btn20: UIButton!
    @IBOutlet weak var money: UITextField!
    
    var tip = 0.0
    var total = 0.0
    var result = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        money.endEditing(true)
        
        btn0.isSelected = false
        btn10.isSelected = false
        btn20.isSelected = false
        
        sender.isSelected = true
        tip = Double(String(sender.currentTitle!).dropLast())!/100
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        person.text = Int(sender.value).description
    }
    
    @IBAction func tapCal(_ sender: UIButton) {
        let res = money.text
        if res != "" {
            total = Double(res!)!
            let solve = total * (1+tip) / Double(person.text!)!
            result = String(format: "%.2f", solve)
        }
        self.performSegue(withIdentifier: "goToResult", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult"){
            let destination1 = segue.destination as! ResultController
            destination1.result = result
            destination1.tip = Int(tip*100)
            destination1.person = Int(person.text!)!
        }
    }
}

extension UIColor {
    convenience init(hexaString: String, alpha: CGFloat = 1) {
        let chars = Array(hexaString.dropFirst())
        self.init(red:   .init(strtoul(String(chars[0...1]),nil,16))/255,
                  green: .init(strtoul(String(chars[2...3]),nil,16))/255,
                  blue:  .init(strtoul(String(chars[4...5]),nil,16))/255,
                  alpha: alpha)}
}
