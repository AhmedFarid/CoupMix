//
//  categCell.swift
//  CoupMix
//
//  Created by farido on 12/13/18.
//  Copyright © 2018 farido. All rights reserved.
//

import UIKit

class categCell: UICollectionViewCell {
    
    
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    func configuerCell(prodect: cate_list) {
        
        title.text = prodect.title
        
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
