//
//  searchVC.swift
//  CoupMix
//
//  Created by AHMED on 12/14/18.
//  Copyright © 2018 farido. All rights reserved.
//

import UIKit

class searchVC: UIViewController {

    
    @IBOutlet weak var locationTF: UITextField!
    @IBOutlet weak var prandTF: UITextField!
    
    var locations = [locationListData]()
    var brands = [brandListData]()
    
    var selectedBrand = ""
    var selectedBrand2 = ""
    
    var selectedLocation: String?
    var selectedbrands: String?
    
    var singItem: cate_list?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(singItem?.id ?? "asa")
        //createLocationPiker()
        handleRefreshLocation()
        
        textEnabeld()
    }
    
    
    func textEnabeld() {
        if locations.isEmpty == true {
            locationTF.isEnabled = false
            //prandTF.isEnabled = false
        }else {
            locationTF.isEnabled = true
            //prandTF.isEnabled = true
        }
        
        if brands.isEmpty == true {
            //locationTF.isEnabled = false
            prandTF.isEnabled = false
        }else {
            //locationTF.isEnabled = true
            prandTF.isEnabled = true
        }
    }
    
    @objc private func handleRefreshLocation() {
        
        API_SEARCH.loactionLis(id: singItem?.id ?? "") { (error: Error?, locations: [locationListData]?) in
            if let locations = locations {
                self.locations = locations
                print("xxx\(self.locations)")
                self.createLocationPiker()
                self.textEnabeld()
            }
        }
    }
    
    @objc private func handleRefreshBrands() {
        
        API_SEARCH.brand_list(country: selectedBrand) { (error: Error?, brands: [brandListData]?) in
            if let brands = brands {
                self.brands = brands
                print("xxx\(self.brands)")
                self.createBrandPiker()
                self.textEnabeld()
            }
        }
    }
    
    func createLocationPiker(){
        let locationPiker = UIPickerView()
        locationPiker.delegate = self
        locationPiker.dataSource = self
        locationPiker.tag = 0
        locationTF.inputView = locationPiker
        locationPiker.reloadAllComponents()
    }
    
    func createBrandPiker(){
        let brandPiker = UIPickerView()
        brandPiker.delegate = self
        brandPiker.dataSource = self
        brandPiker.tag = 1
        prandTF.inputView = brandPiker
        brandPiker.reloadAllComponents()
    }
    
    @IBAction func searchBtn(_ sender: Any) {
        if prandTF.text != "" {
            performSegue(withIdentifier: "suge", sender: nil)
        }else {
            print("no")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let searchResult = segue.destination as? searchDetailsVC {
            searchResult.barnds = selectedbrands ?? ""
            searchResult.location = selectedLocation ?? ""
        }
    }
}

extension searchVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return locations.count
        }else {
            return brands.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return locations[row].country
        }else {
            return brands[row].name
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            selectedLocation = locations[row].country
            self.selectedBrand = selectedLocation ?? ""
            handleRefreshBrands()
            locationTF.text = selectedLocation
        }else {
            selectedbrands = "\(brands[row].name)"
            prandTF.text = brands[row].name
        }
    }
}
