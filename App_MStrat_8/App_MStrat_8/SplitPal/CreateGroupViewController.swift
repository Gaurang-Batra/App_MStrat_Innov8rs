//
//  CreateGroupViewController.swift
//  App_MStrat_8
//
//  Created by Gaurang  on 04/12/24.
//

import UIKit

class CreateGroupViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var addmemberbutton: UIButton!
    
    @IBOutlet var categoryButton: [UIButton]!
    
    
    var isButtonPressed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newHeight: CGFloat = 50  // Desired width
           var frame = textField.frame
        frame.size.height = newHeight
           textField.frame = frame

        addSFSymbolToAddMemberButton()

              // Do any additional setup after loading the view.
//        categoryButton.backgroundColor = .green
//        categoryButton.tintColor = .gray
//        
//        // Set the image and title for the button
//               categoryButton.setImage(UIImage(named: "traveler"), for: .normal)
//               categoryButton.setTitle("trip", for: .normal)
//
//               // Resize the image (optional) to make it smaller
//               if let originalImage = UIImage(named: "traveler") {
//                   let resizedImage = resizeImage(image: originalImage, targetSize: CGSize(width: 30, height: 30))
//                   categoryButton.setImage(resizedImage, for: .normal)
//               }
//
//               // Adjust the button's layout to arrange the image above the text
//               categoryButton.imageEdgeInsets = UIEdgeInsets(top: -10, left: 0, bottom: 0, right: 0) // Moves image upwards
//               categoryButton.titleEdgeInsets = UIEdgeInsets(top: 10, left: -40, bottom: 0, right: 0) // Moves title downwards
//
//               // Vertically center the content within the button
//               categoryButton.contentVerticalAlignment = .center
//               categoryButton.contentHorizontalAlignment = .center
          }
   
    

    
    @IBAction func categoryButtontapped(_ sender: UIButton) {
        for button in categoryButton {
            button.tintColor = .gray // Reset to the default color
            }
    
        
        sender.tintColor = .orange
    }
    
    @IBAction func cancelbuttontapped(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func addSFSymbolToAddMemberButton() {
          // Create the SF Symbol
          if let symbolImage = UIImage(systemName: "person.fill.badge.plus") {
              
              // Apply a specific symbol configuration (optional, for outline or non-filled style)
              let symbolConfig = UIImage.SymbolConfiguration(weight: .regular) // Regular weight for the symbol
              
              // Optionally, change the rendering mode to .hierarchical or .monochrome for different effects
              let outlinedSymbolImage = symbolImage.withConfiguration(symbolConfig).withRenderingMode(.alwaysTemplate)
              
              // Set the SF Symbol image with desired configuration
              addmemberbutton.setImage(outlinedSymbolImage, for: .normal)
              
              // Apply color (e.g., blue color for the symbol)
              addmemberbutton.tintColor = .blue  // Change to any color you need, e.g., .red, .green, etc.
              
              // Add the button's title and adjust spacing (you may adjust padding as needed)
              var config = UIButton.Configuration.plain()
              config.imagePadding = 8  // Space between the symbol and the title
//              config.title = "Add Member"
              config.imagePlacement = .leading  // Position image to the left of the title
              
              // Apply the configuration to the button
              addmemberbutton.configuration = config
          }
      }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
           let size = image.size
           let widthRatio  = targetSize.width  / size.width
           let heightRatio = targetSize.height / size.height

           // Determine the scale factor to maintain aspect ratio
           let scaleFactor = min(widthRatio, heightRatio)

           // Calculate the new size
           let newSize = CGSize(width: size.width * scaleFactor, height: size.height * scaleFactor)

           // Create a new image context and draw the resized image
           UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
           image.draw(in: CGRect(origin: .zero, size: newSize))
           let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
           UIGraphicsEndImageContext()

           return resizedImage ?? image // Return the resized image
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
