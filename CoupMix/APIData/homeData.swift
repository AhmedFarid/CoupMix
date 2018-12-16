//
//  sliderData.swift
//  CoupMix
//
//  Created by farido on 12/13/18.
//  Copyright © 2018 farido. All rights reserved.
//

import UIKit
import SwiftyJSON

class sliderData: NSObject {
    
    
    var c_img: String
    
    init?(dict: [String: JSON]) {
        guard let c_img = dict["c_img"]?.string else { return nil }
        
        self.c_img = c_img
    }
}
