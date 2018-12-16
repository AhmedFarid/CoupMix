//
//  API+ORDERES.swift
//  CoupMix
//
//  Created by farido on 12/16/18.
//  Copyright © 2018 farido. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API_ORDAER: NSObject {
    
    class func orderBook(c_name: String, c_email: String,c_address: String, c_phone: String, c_note: String ,completion: @escaping (_ error: Error?,_ orderId: [orderId]?)-> Void) {
        
        let url = URLs.saveorder
        
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        let parameters: [String: Any] = [
            "lang": lang,
            "c_name": c_name,
            "c_email": c_email,
            "c_address": c_address,
            "c_phone": c_phone,
            "c_note": c_note
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var locationLists = [orderId]()
                for data in dataArray {
                    if let data = data.dictionary, let locationList = orderId.init(dict: data){
                        locationLists.append(locationList)
                    }
                }
                completion(nil, locationLists)
            }
            
        }
    }
}

