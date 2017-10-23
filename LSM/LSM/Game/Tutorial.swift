//
//  Tutorial.swift
//  LSM
//
//  Created by Jorge Mendez on 10/22/17.
//  Copyright © 2017 Jorge Mendez. All rights reserved.
//

import Foundation
import UIKit

class Tutorial{
    var strText : String!
    var isVideo : Bool!
    var imgImage : UIImage!
    var urlResource : String!
    
    
    init(strText_I : String, isVideo_I : Bool, imgImage_I : UIImage!, urlResource_I : String!) {
        strText  = strText_I
        isVideo = isVideo_I
        imgImage = imgImage_I
        urlResource = urlResource_I
    }
    
}
