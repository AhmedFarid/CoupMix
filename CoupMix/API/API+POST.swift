//
//  API+POST.swift
//  CoupMix
//
//  Created by farido on 12/13/18.
//  Copyright © 2018 farido. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIPOST: NSObject {
    // POST
    class func POST(url: String, parameters: [String:Any], header: [String:Any]?, completion: @escaping (_ success: Bool, _ result: [String:AnyObject]?) -> Void) {
        
        request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header as? HTTPHeaders).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                print(error)
                completion(false, nil)
            case .success(let value):
                print(value)
                completion(true, value as? [String:AnyObject])
            }
        }
    }
    
    
    
    
    // Get
    class func Get(url: String, parameters: [String:Any]?, header: [String:Any]?, completion: @escaping (_ success: Bool?, _ result: [String:AnyObject]?) -> Void) {
        
        request(url, method: .get, parameters: parameters, encoding: JSONEncoding.default, headers: header as? HTTPHeaders).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                print(error)
                completion(false, nil)
            case .success(let value):
                print(value)
                completion(true, value as? [String:AnyObject])
            }
        }
    }
}
