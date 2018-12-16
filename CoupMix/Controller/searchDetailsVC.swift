//
//  searchDetailsVC.swift
//  CoupMix
//
//  Created by farido on 12/16/18.
//  Copyright © 2018 farido. All rights reserved.
//

import UIKit

class searchDetailsVC: UIViewController {

    
    
    @IBOutlet weak var tabelView: UITableView!
    var searchs = [featureOffers]()
    var barnds = ""
    var location = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(barnds + location)
        
        tabelView.dataSource = self
        tabelView.delegate = self
        handleRefreshOffers()
    }
    
    @objc private func handleRefreshOffers() {
        
        API_SEARCH.search_list(brand: barnds, country: location ){ (error: Error?, searchs: [featureOffers]?) in
            if let searchs = searchs {
                self.searchs = searchs
                print("xxx\(self.searchs)")
                self.tabelView.reloadData()
            }
        }
    }

}

extension searchDetailsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tabelView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? searchListCell {
            let search = searchs[indexPath.row]
            cell.configuerCell(prodect: search)
            return cell
        }else{
            return searchListCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: searchs[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let brandDetials = segue.destination as? brandDetilasVC {
            brandDetials.singleItem = sender as? featureOffers
        }
    }
}
