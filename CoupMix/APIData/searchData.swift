//
//  searchData.swift
//  CoupMix
//
//  Created by AHMED on 12/14/18.
//  Copyright © 2018 farido. All rights reserved.
//

import UIKit
import SwiftyJSON

class locationListData: NSObject {
    
  
    var country: String
    
    
    init?(dict: [String: JSON]) {
        guard let country = dict["country"]?.string else { return nil }
        
        self.country = country
    }
}

class orderId: NSObject {
    
    
    var id: Int
    
    
    init?(dict: [String: JSON]) {
        guard let id = dict["id_order"]?.int else { return nil }
        self.id = id
    }
}



class brandListData: NSObject {
    
    var id: Int
    var name: String
    
    
    init?(dict: [String: JSON]) {
        guard let name = dict["name "]?.string, let id = dict["id"]?.int else { return nil }
        
        self.name = name
        self.id = id
    }
}
