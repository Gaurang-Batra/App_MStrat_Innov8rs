//
//  homeViewController.swift
//  App_MStrat_8
//
//  Created by student-2 on 09/01/25.
//

import UIKit

class homeViewController: UIViewController {

    @IBOutlet weak var expensebutton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        expensebutton.layer.cornerRadius = expensebutton.frame.size.width / 2
                expensebutton.clipsToBounds = true


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
