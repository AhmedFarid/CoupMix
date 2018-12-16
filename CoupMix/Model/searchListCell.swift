//
//  searchListCell.swift
//  CoupMix
//
//  Created by farido on 12/16/18.
//  Copyright © 2018 farido. All rights reserved.
//

import UIKit
import Kingfisher

class searchListCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    @IBOutlet weak var broImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var offer_percentage: UILabel!
    @IBOutlet weak var location: UILabel!
    
    func configuerCell(prodect: featureOffers) {
        
        location.text = prodect.location
        title.text = prodect.title
        offer_percentage.text = "\(prodect.offer_percentage)%"
        broImage.image = UIImage(named: "placeholder")
        let s = ("http://coupomix.com/\(prodect.image)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        broImage.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            broImage.kf.setImage(with: url)
        }
    }
    
}
