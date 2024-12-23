//
//  inGroupViewController.swift
//  App_MStrat_8
//
//  Created by student-2 on 23/12/24.
//

import UIKit

class GroupDetailViewController: UIViewController {

   
    @IBOutlet weak var groupimageoutlet: UIImageView!
    
    @IBOutlet weak var groupnamelabel: UILabel!
    
    @IBOutlet weak var memberslabel: UILabel!
    
    @IBOutlet weak var amountlabel: UILabel!
    
    var groupItem: GroupSplitTests?
       
       override func viewDidLoad() {
           super.viewDidLoad()

           // Use groupItem to update the UI, for example:
           if let item = groupItem {
                  groupnamelabel?.text = item.name
                  groupimageoutlet?.image = item.image
              }
           else {
                  print("groupItem is nil")
              }
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
