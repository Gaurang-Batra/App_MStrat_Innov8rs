//
//  SplitpalViewController.swift
//  App_MStrat_8
//
//  Created by Gaurang  on 04/12/24.
//

import UIKit

class SplitpalViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var Balanceviewcontainer: UIView!
    
    @IBOutlet weak var Groupsviewcontainer: UIView!
    
    
    @IBOutlet weak var addgroupbutton: UIButton!
    
    
    @IBOutlet weak var welcomeimage: UIImageView!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
               tableView.dataSource = self
        


        // Do any additional setup after loading the view.
       
        
            if let image = UIImage(named: "Group")
            {
                welcomeimage.image = image
            }
            
            
            Balanceviewcontainer.layer.cornerRadius = 20
                   Balanceviewcontainer.layer.masksToBounds = true
                   
        setTopCornerRadius(for: Groupsviewcontainer, radius: 20)
            
            createVerticalDottedLineInBalanceContainer(atX: Balanceviewcontainer.bounds.size.width / (5/2))
        
            addgroupbutton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            addgroupbutton.titleLabel?.textAlignment = .center
                   
         
                   
            makeButtonCircular()
        tableView.separatorStyle = .singleLine
     
        
                    
               }
    
    func setTopCornerRadius(for view: UIView, radius: CGFloat) {
        let path = UIBezierPath(
            roundedRect: view.bounds,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: radius, height: radius)
        )
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        view.layer.mask = maskLayer
    }
        
        func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
            let size = image.size
            let widthRatio  = targetSize.width  / size.width
            let heightRatio = targetSize.height / size.height

            // Determine the scale factor to preserve aspect ratio
            let scaleFactor = min(widthRatio, heightRatio)

            // Calculate the new size
            let newSize = CGSize(width: size.width * scaleFactor, height: size.height * scaleFactor)

            // Resize the image
            UIGraphicsBeginImageContextWithOptions(newSize, false, image.scale)
            image.draw(in: CGRect(origin: .zero, size: newSize))
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            return resizedImage ?? image
        }
        func createVerticalDottedLineInBalanceContainer(atX xPosition: CGFloat) {
            let dottedLine = CAShapeLayer()
                
                // Create a UIBezierPath for the line
                let path = UIBezierPath()
                
                // Center the line vertically (Y-axis remains fixed)
                let centerY = Balanceviewcontainer.bounds.size.height / 2
                
                // Define the length of the line (in points)
                let lineLength: CGFloat = 98 // You can change this value
                
                // Calculate the starting and ending Y coordinates to center the line vertically
                let startY = centerY - (lineLength / 2)  // Start Y is half of the line length above center
                let endY = startY + lineLength          // End Y is half of the line length below center
                
                // Start point at the provided X position and calculated start Y
                path.move(to: CGPoint(x: xPosition, y: startY))
                
                // End point at the provided X position and calculated end Y
                path.addLine(to: CGPoint(x: xPosition, y: endY))
                
                // Assign the path to the CAShapeLayer
                dottedLine.path = path.cgPath
                dottedLine.strokeColor = UIColor.black.withAlphaComponent(0.4).cgColor // Adjust opacity
            dottedLine.lineWidth = 1.5 // Thickness of the line
                
                // Set the line to be dotted (dash pattern)
                dottedLine.lineDashPattern = [6, 2] // Dash length and space length
                
                // Add the dotted line to the Balanceviewcontainer's layer
                Balanceviewcontainer.layer.addSublayer(dottedLine)
        }

               // Function to make the UIImageView circular
        func makeButtonCircular() {
              // Ensure the button is square by checking both width and height
              let sideLength = min(addgroupbutton.frame.size.width, addgroupbutton.frame.size.height)
              
              // Make the button circular by setting the corner radius to half the side length
              addgroupbutton.layer.cornerRadius = sideLength / 2
              
              // Enable masksToBounds to make sure the content fits inside the rounded corner
              addgroupbutton.layer.masksToBounds = true
          }
    // MARK: - UITableViewDataSource Methods
     
    var selectedGroupIndex: Int? = nil

    @IBOutlet weak var tableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return group.count // Each group item gets its own section
     }
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 1 // Each section has only one row
     }
     
     // Configure the cell for each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SplitCell", for: indexPath)
        
        let groupItem = group[indexPath.section]
        
        cell.textLabel?.text = groupItem.name
        cell.imageView?.image = groupItem.image
        
        return cell
    }

     // MARK: - UITableViewDelegate Methods
     
     // Handle row selection
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         // Deselect the row after selection
         tableView.deselectRow(at: indexPath, animated: true)
         
         // Store the selected section index (not row)
         selectedGroupIndex = indexPath.section
         
         // Perform the segue when a row is selected
         performSegue(withIdentifier: "Groupsdetails", sender: self)
     }
     
     // MARK: - Segue Preparation
     
     // Prepare for segue when navigating to GroupDetailViewController
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Check if the segue identifier matches "Groupsdetails"
         if segue.identifier == "Groupsdetails",
            let destinationVC = segue.destination as? GroupDetailViewController {
             
             // Ensure the selected index is valid
             if let selectedIndex = selectedGroupIndex {
                 // Fetch the selected group from the array using the section index
                 let selectedGroup = group[selectedIndex]
                 
                 // Pass the selected group object to the destination view controller
                 destinationVC.groupItem = selectedGroup
             }
         }
     }

     // Optional: Set height for rows
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 60 // Set the height of the cell
     }
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let view = UIView()
//        view.backgroundColor = .clear // Make the footer transparent
//        return view
//    }
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//           return 10 // This adds space after each row
//       }
    

          
}
