//
//  sliderCell.swift
//  CoupMix
//
//  Created by farido on 12/13/18.
//  Copyright © 2018 farido. All rights reserved.
//

import UIKit
import Kingfisher

class sliderCell: UICollectionViewCell {
    
    
    @IBOutlet weak var Image: UIImageView!
    
    func configuerCell(prodect: sliderData) {
        
        Image.image = UIImage(named: "placeholder")
        let s = ("\(URLs.mainImage)\(prodect.c_img)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        Image.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            Image.kf.setImage(with: url)
        }
    }
    
}
