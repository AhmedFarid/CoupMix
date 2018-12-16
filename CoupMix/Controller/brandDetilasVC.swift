//
//  brandDetilasVC.swift
//  CoupMix
//
//  Created by AHMED on 12/14/18.
//  Copyright © 2018 farido. All rights reserved.
//

import UIKit

class brandDetilasVC: UIViewController {

    var singleItem: featureOffers?
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var coponeDes: UILabel!
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = singleItem?.title
        
        image.image = UIImage(named: "placeholder")
        let s = ("http://coupomix.com/\(singleItem?.image ?? "")")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        image.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            image.kf.setImage(with: url)
        }
        
        coponeDes.text = "Feature Offer: \(singleItem?.feature_offer ?? "") \nDiscount Percentage: \(singleItem?.offer_percentage ?? "")%"
        desc.text = "Description:\n\(singleItem?.descrip ?? "")\n\nCopon Details:\n\(singleItem?.copon_details ?? "")"
        phone.text = "Phone: \(singleItem?.phone ?? "")"
        location.text = "Location: \(singleItem?.location ?? "")"

    }

}
