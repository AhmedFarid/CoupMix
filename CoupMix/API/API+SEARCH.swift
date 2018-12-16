//
//  API+SEARCH.swift
//  CoupMix
//
//  Created by AHMED on 12/14/18.
//  Copyright © 2018 farido. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API_SEARCH: NSObject {

    class func loactionLis(id: String ,completion: @escaping (_ error: Error?,_ locationList: [locationListData]?)-> Void) {
    
    let url = URLs.location_list
    
    let lang = NSLocalizedString("en", comment: "profuct list lang")
    
    let parameters: [String: Any] = [
        "lang": lang,
        "id": id
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
            var locationLists = [locationListData]()
            for data in dataArray {
                if let data = data.dictionary, let locationList = locationListData.init(dict: data){
                    locationLists.append(locationList)
                }
            }
            completion(nil, locationLists)
            }
        
        }
    }
    
    class func brand_list(country: String ,completion: @escaping (_ error: Error?,_ brandList: [brandListData]?)-> Void) {
        
        let url = URLs.List_all_brand
        
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        let parameters: [String: Any] = [
            "lang": lang,
            "country": country
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
                var brandLists = [brandListData]()
                for data in dataArray {
                    if let data = data.dictionary, let brandList = brandListData.init(dict: data){
                        brandLists.append(brandList)
                    }
                }
                completion(nil, brandLists)
            }
            
        }
    }
    
    class func search_list(brand: String,country: String ,completion: @escaping (_ error: Error?,_ brandList: [featureOffers]?)-> Void) {
        
        let url = URLs.search_Result_list
        
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        let parameters: [String: Any] = [
            "lang": lang,
            "country": country,
            "brand": brand
        ]
        print(parameters)
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
                var brandLists = [featureOffers]()
                for data in dataArray {
                    if let data = data.dictionary, let brandList = featureOffers.init(dict: data){
                        brandLists.append(brandList)
                    }
                }
                completion(nil, brandLists)
            }
            
        }
    }
    
    
}
