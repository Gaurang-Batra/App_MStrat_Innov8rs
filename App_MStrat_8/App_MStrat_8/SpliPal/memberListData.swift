//
//  memberListData.swift
//  App_MStrat_8
//
//  Created by Gaurang  on 06/12/24.
//

import Foundation
import UIKit

struct Members{
    var profile : UIImage?
    var name : String
    var phonenumber : Int
    var hasJoined: Bool
    
}

let members: [Members] = [
    Members(profile: UIImage(named: "profile"), name: "Ankush", phonenumber: 98934987, hasJoined: true),
    Members(profile: UIImage(named: "profile"), name: "John", phonenumber: 98934988, hasJoined: false),
    Members(profile: UIImage(named: "profile"), name: "Sara", phonenumber: 98934989, hasJoined: true),
    Members(profile: UIImage(named: "profile"), name: "Mark", phonenumber: 98934990, hasJoined: false)
]
