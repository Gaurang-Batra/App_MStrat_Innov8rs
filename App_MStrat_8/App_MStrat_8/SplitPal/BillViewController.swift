//
//  BillViewController.swift
//  App_MStrat_8
//
//  Created by student-2 on 20/12/24.
//

import UIKit

class BillViewController: UIViewController {

  
    @IBOutlet weak var titletextfield: UITextField!
    
    @IBOutlet weak var pricetextfield: UITextField!
    
    @IBOutlet weak var categorytextfield: UITextField!
    
    @IBOutlet weak var paidbytextfield: UITextField!
    
    override func viewDidLoad() {
           super.viewDidLoad()

           customizeTextField(titletextfield)
           customizeTextField(pricetextfield)
           customizeTextField(categorytextfield)
           customizeTextField(paidbytextfield)
       }

       private func customizeTextField(_ textField: UITextField) {
           // Remove border
           textField.borderStyle = .none
           
           // Add underline
           let underline = CALayer()
           underline.frame = CGRect(x: 0, y: textField.frame.height - 1, width: textField.frame.width, height: 1)
           underline.backgroundColor = UIColor.lightGray.cgColor
           textField.layer.addSublayer(underline)
       }

}
