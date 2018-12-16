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

class cate_list: NSObject {
    
    var id: String
    var image: String
    var title: String
    
    
    init?(dict: [String: JSON]) {
        guard let image = dict["image"]?.string,let id = dict["id"]?.string,let title = dict["title"]?.string else { return nil }
        
        self.image = image
        self.id = id
        self.title = title
    }
}

class featureOffers: NSObject {
    
    var title: String
    var descrip: String
    var image: String
    var offer_percentage: String
    var copon_details: String
    var feature_offer: String
    var location: String
    var phone: String
    
    
    init?(dict: [String: JSON]) {
        guard let title = dict["title"]?.string,let descrip = dict["description"]?.string,let image = dict["image"]?.string,let offer_percentage = dict["offer_percentage"]?.string,let copon_details = dict["copon_details"]?.string,let feature_offer = dict["feature_offer"]?.string,let location = dict["location"]?.string,let phone = dict["phone"]?.string else { return nil }
        
        self.title = title
        self.descrip = descrip
        self.image = image
        self.offer_percentage = offer_percentage
        self.copon_details = copon_details
        self.feature_offer = feature_offer
        self.location = location
        self.phone = phone
    }
}


