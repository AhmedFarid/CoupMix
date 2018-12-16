//
//  featureOfferCell.swift
//  CoupMix
//
//  Created by farido on 12/13/18.
//  Copyright © 2018 farido. All rights reserved.
//

import UIKit

class featureOfferCell: UICollectionViewCell {
    
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var offer_percentage: UILabel!
    
    func configuerCell(prodect: featureOffers) {
        
        title.text = prodect.title
        offer_percentage.text = "\(prodect.offer_percentage)%"
        
        Image.image = UIImage(named: "placeholder")
        let s = ("http://coupomix.com/\(prodect.image)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        Image.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            Image.kf.setImage(with: url)
        }
    }
    
}
