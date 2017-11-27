//
//  Tutorial.swift
//  LSM
//
//  Created by Jorge Mendez on 10/22/17.
//  Copyright © 2017 Jorge Mendez. All rights reserved.
//

import Foundation
import UIKit
import Cloudinary
class Tutorial{
    var strText : String!
    var isVideo : Bool!
    var imgImage : UIImage!
    var urlResource : String!
    
    
    init(strText_I : String, isVideo_I : Bool, urlResource_I : String!) {
        strText  = strText_I
        isVideo = isVideo_I
        urlResource = urlResource_I
    }
    
    func getComplteURL() -> String{
        let config = CLDConfiguration(cloudName: "itesmlsm", apiKey: "885279298663878")
        let cloudinary = CLDCloudinary(configuration: config)
        
        let url = cloudinary.createUrl().generate(urlResource)?.replacingOccurrences(of: "image", with:"video")
        return url!
        
    }
    
    func getImage() -> UIImage{
        let config = CLDConfiguration(cloudName: "itesmlsm", apiKey: "885279298663878")
        let cloudinary = CLDCloudinary(configuration: config)
        
        let nurl = URL(string: cloudinary.createUrl().generate(urlResource)!)
        let imageD = NSData(contentsOf: nurl!)
        return UIImage(data: imageD! as Data)!
    }
    
}
