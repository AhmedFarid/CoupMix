//
//  OrderBookVC.swift
//  CoupMix
//
//  Created by farido on 12/16/18.
//  Copyright © 2018 farido. All rights reserved.
//

import UIKit

class OrderBookVC: UIViewController {

    @IBOutlet weak var FNTF: UITextField!
    @IBOutlet weak var adTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var notsTF: UITextField!
    
    var orderI = [orderId]()
    var orders: orderId?
    var id = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func orderBTN(_ sender: Any) {
    
        API_ORDAER.orderBook(c_name: FNTF.text ?? "", c_email: emailTF.text ?? "", c_address: adTF.text ?? "", c_phone: phoneTF.text ?? "", c_note: notsTF.text ?? "") { (error: Error?, orderI: [orderId]?)in
            if let orderI = orderI {
                self.orderI = orderI
                print("xxx\(self.orderI)")
                for order in orderI {
                    print("\(order.id)")
                    self.id = order.id
                    
                }
                self.showAlert(title: "order success", message: "thanks for order \n Your order Id is: \(self.id)")
            }
            
            
        }
    }
}
