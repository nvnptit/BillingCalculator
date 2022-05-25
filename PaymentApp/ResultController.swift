//
//  ResultController.swift
//  PaymentApp
//
//  Created by Nhat on 25/05/2022.
//

import Foundation
import UIKit

class ResultController: UIViewController {
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var detail: UILabel!
    
    var result = "0.0"
    var tip = 10
    var person = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        total.text = result
        detail.text = "Split between \(person) people, with \(tip)% tip!"
    }
    
    @IBAction func reCalPressed(_ sender: UIButton) {
        self.dismiss(animated: true,completion: nil)
    }
}
