//
//  HOME+API.swift
//  CoupMix
//
//  Created by farido on 12/13/18.
//  Copyright © 2018 farido. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class API_Home: NSObject {
    
    class func banner(completion: @escaping (_ error: Error?,_ banner: [sliderData]?)-> Void) {
        
        let url = URLs.slider
        
        
         Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
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
                var banners = [sliderData]()
                for data in dataArray {
                    if let data = data.dictionary, let banner = sliderData.init(dict: data){
                        banners.append(banner)
                    }
                }
                completion(nil, banners)
            }
            
        }
    }
    
    class func category(completion: @escaping (_ error: Error?,_ categor: [cate_list]?)-> Void) {
        
        let url = URLs.cate_list
        
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        let parameters: [String: Any] = [
            "lang": lang
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
                var categors = [cate_list]()
                for data in dataArray {
                    if let data = data.dictionary, let categor = cate_list.init(dict: data){
                        categors.append(categor)
                    }
                }
                completion(nil, categors)
            }
            
        }
    }
    
    class func featureOffer(completion: @escaping (_ error: Error?,_ featureOffer: [featureOffers]?)-> Void) {
        
        let url = URLs.featureOffers
        
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        let parameters: [String: Any] = [
            "lang": lang
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
                var featureOfferss = [featureOffers]()
                for data in dataArray {
                    if let data = data.dictionary, let featureOffer = featureOffers.init(dict: data){
                        featureOfferss.append(featureOffer)
                    }
                }
                completion(nil, featureOfferss)
            }
            
        }
    }

    
}
